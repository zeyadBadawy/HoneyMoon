//
//  ContentView.swift
//  HoneyMoon
//
//  Created by Zeyad Badawy on 15/05/2022.
//

import SwiftUI
import UIKit

struct ContentView: View {
    //MARK: PROPERTIES
    @State var showAlert:Bool = false
    @State var showGuideView:Bool = false
    @State var showInfoView:Bool = false
    @GestureState private var dragState:DragState = .inActive
    private var dragAreaThreshold:CGFloat = 65.0
    @State private var lastCardIndex = 1
    @State var cardRemovalTransition = AnyTransition.trailingBottom
    
    //MARK: DRAG STATES
    
    enum DragState {
        case inActive
        case pressing
        case dragging(translation:CGSize)
        
        var translation:CGSize {
            switch self {
            case .inActive , .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging:Bool {
            switch self {
            case .dragging:
                return true
            case .pressing , .inActive:
                return false
            }
        }
        
        var isPressing:Bool {
            switch self {
            case .dragging , .pressing:
                return true
            case .inActive:
                return false
            }
        }
    }
    
    
    //MARK: CARD VIEWS
    
    @State var cardViews:[CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(destination: honeyMoonData[index]))
        }
        return views
    }()
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    func moveCards() {
        cardViews.removeFirst()
        self.lastCardIndex += 1
        let honeyMoon = honeyMoonData[lastCardIndex % honeyMoonData.count]
        let newCard = CardView(destination: honeyMoon)
        cardViews.append(newCard)
    }
    
    //MARK: BODY
    var body: some View {
        VStack {
            //MARK: HEADER
            HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            Spacer()
            
            
            //MARK: CARD VIEWS
            
            ZStack{
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "x.circle")
                                    .modifier(ImageModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && isTopCard(cardView: cardView) ? 1 : 0)
                                Image(systemName: "heart.circle")
                                    .modifier(ImageModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && isTopCard(cardView: cardView) ? 1 : 0)
                            }
                        )
                        .offset(x: isTopCard(cardView: cardView) ? self.dragState.translation.width : 0 ,
                                y: isTopCard(cardView: cardView) ?   self.dragState.translation.height : 0 )
                        .scaleEffect( self.dragState.isDragging && isTopCard(cardView: cardView) ? 0.85 : 1 )
                        .rotationEffect( Angle(degrees: isTopCard(cardView: cardView) ? self.dragState.translation.width/12 : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { value, state, transaction in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default :
                                    break
                                }
                            })
                                .onChanged({ value in
                                    guard case .second(true ,let drag?) = value else {
                                        return
                                    }
                                    if drag.translation.width < -self.dragAreaThreshold{
                                        self.cardRemovalTransition = .leadingBottom
                                    }
                                    
                                    if drag.translation.width > self.dragAreaThreshold{
                                        self.cardRemovalTransition = .trailingBottom
                                    }
                                })
                                .onEnded({ value in
                                    guard case .second(true ,let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold ||
                                        drag.translation.width > self.dragAreaThreshold {
                                        playSound(sound: "sound-rise", type:"mp3" )
                                        self.moveCards()
                                    }
                                })
                        )
                        .transition(self.cardRemovalTransition)
                }
            }
            .padding(.horizontal)
            Spacer()
            
            
            //MARK: FOOTER
            FooterView(showBookingAlert: $showAlert)
                .frame(height: 80)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("success".uppercased()), message: Text("wishing the lovely and the most precious what is the time together for the amazing couple."), dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
