//
//  LeaderBoardView.swift
//  bulleye
//
//  Created by Ai on 2022/10/03.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
               ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices) { i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                   }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constant.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constant.Leaderboard.leaderboardDateColWidth)
            
            
        }
        
        .background(
            RoundedRectangle(cornerRadius:
                    .infinity)
            .strokeBorder(Color("LeaderboardRowColor"),
                          lineWidth: Constant.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constant.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Binding var leaderboardIsShowing: Bool
    
    @Environment( \.verticalSizeClass) var verticalSizeClass
    @Environment( \.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "LeaderView")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "LeaderView")
                }
            }
            .padding(.top)
            HStack {
                Spacer()
                Button(action: {leaderboardIsShowing = false} ) {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
                
                
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width:
                        Constant.General.roundedViewLenght)
            Spacer()
            LabelText(text: "Score")
                .frame(width:Constant.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constant.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constant.Leaderboard.leaderboardMaxRowWidth)
    }
    
    
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    static var previews: some View {
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.dark)
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.dark)
        
            .previewLayout(.fixed(width: 568, height: 320))
        
    }
}
