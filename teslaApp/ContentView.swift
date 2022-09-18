//
//  ContentView.swift
//  teslaApp
//
//  Created by Jalome Chirwa on 2022/09/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            ScrollView{
                HeaderComponent()
                UnderLineComponent()
                CarSectionComponent()
                CategoryComponent()
                
            }
            .padding()
            
            VoiceCommandButtonComponent()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("PrimaryBlack"))
        .foregroundColor(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// components
struct CategoryComponent:View {
    var body: some View{
        VStack{
            HStack(alignment: .center){
                Text("Quick Shortcuts")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Text("Edit")
                    .font(.caption)
            }
            .padding(.top,10)
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .top){
                    IconButtonAndTextComponent(iconName: "bolt.fill", buttonText: "Charging")
                    IconButtonAndTextComponent(iconName: "fanblades.fill", buttonText: "Fan on")
                    IconButtonAndTextComponent(iconName: "play.fill", buttonText: "Media\nControls")
                    IconButtonAndTextComponent(iconName: "bolt.car", buttonText: "Close\ncharge port")

                }
            }
        }
    }
}


struct CarSectionComponent: View{
    var body: some View{
        VStack{
            HStack(alignment: .center){
                HStack{
                    Image(systemName: "battery.75")
                    Text("237 Miles")
                }
                .font(.system(size:20,design: .rounded))
                .foregroundColor(Color("PrimaryGreen"))
                Spacer()
                VStack(alignment: .trailing){
                    Text("Parked")
                        .fontWeight(.semibold)
                    Text("Last updated: 5 min ago")
                        .font(.system(size: 12))
                        .lineLimit(2)
                        .foregroundColor(Color.white.opacity(0.6))
                    
                }
            }
            .padding(.top)
            Spacer()
            Image(systemName: "car")
                .font(.system(size: 180))
                .padding(.top,25)
                .foregroundColor(Color("PrimaryGreen"))
//                .resizable()
//                .aspectRatio(contentMode: .fit)
            UnderLineComponent()
            
        }
    }
}


struct UnderLineComponent: View{
    var body: some View{
        Rectangle()
            .frame(maxWidth:.infinity)
            .frame(height:0.25)
            .background(Color.white)
            .opacity(0.1)
            .padding(.top)
        
        
    }
}

struct HeaderComponent: View {
    var body: some View{
        HStack{
            VStack(alignment: .leading,spacing: 5) {
                Text("Model 3".uppercased())
                    .padding(.vertical,4)
                    .padding(.horizontal,8)
                    .background(Color("PrimaryRed"))
                    .foregroundColor(Color.white)
                    .clipShape(Capsule())
                Text("Mach Five".uppercased())
                    .font(.title)
                    .fontWeight(.semibold)
            }
            .padding(.all,5.0)
            Spacer()
            HStack{
                IconButtonComponent(iconName: "lock.fill")
                IconButtonComponent(iconName: "gear")
                    
            }
        }
        
    }
}


struct IconButtonComponent: View{
    var iconName: String
    
    var body: some View{
        Image(systemName: iconName)
            .font(.system(size:25))
            .frame(width: 45, height: 45)
            .background(Color.white.opacity(0.05))
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.white.opacity(0.08),lineWidth: 1)
            )
    }
}

struct IconButtonAndTextComponent: View{
    var iconName: String
    var buttonText: String
    var body: some View{
        VStack(alignment: .center){
            IconButtonComponent(iconName: iconName)
            Text(buttonText)
                .frame(width: 72)
                .font(.system(size: 12,weight: .semibold,design: .default))
                .multilineTextAlignment(.center)
        }
    }
}

struct VoiceCommandButtonComponent: View {
    var body: some View {
//          microphone button
        VStack{
            Spacer()
            HStack{
                Spacer()
                Button(action:{},
                    label:{
                        Image(systemName: "mic.fill")
                            .font(.system(size:32,weight: .semibold))
                            .frame(width: 64, height: 64)
                            .background(Color("PrimaryGreen"))
                            .clipShape(Circle())
                            .padding()
                            .shadow(radius: 10)
                            .foregroundColor(Color("PrimaryBlack"))
                    }
                )
            }
        }
        .edgesIgnoringSafeArea(.all)
//          end of microphone button
    }
}
