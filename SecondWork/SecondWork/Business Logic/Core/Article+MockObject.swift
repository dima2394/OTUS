//
//  Article+MockObject.swift
//  SecondWork
//
//  Created by Dmitriy Verennik on 26.02.2023.
//

import Network

extension Article {

    static var mockObject: Article {
        .init(source: Source(id: "wired", name: "wired"),
              author: "Joel Khalili",
              title: "Bitcoin Miners Are Playing a High-Stakes Game of Chicken",
              description: "In the bitter crypto winter, companies are making deep cuts to survive a new challenge.",
              url: "https://www.wired.com/story/bitcoin-mining-halving-crypto-winter/",
              urlToImage: "https://media.wired.com/photos/63eede2c5b4882ebafffb0e1/191:100/w_1280,c_limit/Biz-data-mining-934468788.jpg",
              publishedAt: "2023-02-17T12:00:00Z",
              content: "Its kind of a last-man-standing situation, says Fred Thiel, CEO of US-based Marathon Digital Holdings. His crypto-mining company, among the largest in the world, has found itselflike the rest of the … [+3142 chars]")
    }
}
