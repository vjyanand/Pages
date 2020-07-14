//
//  PagesBuilder.swift
//  Pages
//
//  Created by Nacho Navarro on 03/11/2019.
//  Copyright © 2019 nachonavarro. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import SwiftUI

/**
 A function builder that captures each direct child of `Pages` and adds it to a list.

 This implementation tries to mimic that of `ViewBuilder`. I highly recommed taking a look
 at the public interface of `ViewBuilder` to get a sense of how SwiftUI implements it. In their
 case they wrap the blocks in `buildBlock` on a `TupleView`. This however means we can't
 access each child individually (which is a must in a paging view).  In our case we keep the children
 separated by storing them on a list of type `[AnyView]` that will allow us to store views of different type
 (e.g. a `Text` followed by a `Circle` followed by an `Image`).

 It may look like there's some code duplication, but I have not found a way to reduce it, and in fact I think
 SwiftUI does the same. Further information
 [here](https://forums.swift.org/t/function-builders/25167) and [here](https://github.com/apple/swift-evolution/blob/9992cf3c11c2d5e0ea20bee98657d93902d5b174/proposals/XXXX-function-builders.md).
 */
@available(iOS 13.0, *)
@_functionBuilder
public struct PagesBuilder {


    public static func buildBlock<C0: View>(
        _ c0: C0) -> [AnyView] {
        [AnyView(c0)]
    }

    public static func buildBlock<C0: View, C1: View>(_ c0: C0, _ c1: C1) -> [AnyView] {
        [AnyView(c0), AnyView(c1)]
    }

    public static func buildBlock<C0: View, C1: View, C2: View>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2) -> [AnyView] {
        [AnyView(c0), AnyView(c1), AnyView(c2)]
    }
}
