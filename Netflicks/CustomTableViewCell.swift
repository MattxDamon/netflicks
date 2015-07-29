//
//  CustomTableViewCell.swift
//  Netflicks
//
//  Created by Matthew Barth on 7/28/15.
//  Copyright (c) 2015 Matthew Barth. All rights reserved.
//

import UIKit


class CustomTableViewCell: UITableViewCell, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var section: String!
    var sendToDetail:( (sender: show) -> ())!
    
    var sectionShows: [show]! {
        didSet {
            
            //quickly storing the images from the shows into pageimages array
            for var i = 0; i < sectionShows.count; ++i  {
                pageImages.append(sectionShows[i].imagePath)
            }
            loadVisiblePages()
        }
    }
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    
    func sendToDetailLocal() {
        //change to send the show related to the image, already sending itself i believe
        sendToDetail(sender: sectionShows[pageControl.currentPage])
    }
    
    func loadVisiblePages() {
        //determine the length of the page control
        let pageCount = pageImages.count
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        // Cinderella cleaning the view array
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        //Setting up scroll view
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), pagesScrollViewSize.height)
        let tap = UITapGestureRecognizer(target: self, action: Selector("sendToDetailLocal"))
        tap.delegate = self
        scrollView.addGestureRecognizer(tap)
        
        
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        // Update the page control
        pageControl.currentPage = page
        let firstPage = page - 1
        let lastPage = page + 1
        
        // Clean out the pages that are far away, load mid range
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        for index in firstPage...lastPage {
            loadPage(index)
        }
        
        for var index = lastPage+1; index < pageImages.count; ++index {
            purgePage(index)
        }
    }
    
    func purgePage(page: Int) {
        //check if in page range
        if page < 0 || page >= pageImages.count {
            return
        }
        
        // remove page and reset container
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    func loadPage(page: Int) {
        if page < 0 || page >= pageImages.count {
            //Outside the page range, just chill
            return
        }
        
        // check if already loaded
        if let pageView = pageViews[page] {
        } else {
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
            //Allowing other views to peek in a lil bit
            frame = CGRectInset(frame, 20.0, 0.0)
            
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            scrollView.addSubview(newPageView)
            pageViews[page] = newPageView
        }
    }
    
    //where you scroll on the view (basically like  massive gesture recognizer)
    func scrollViewDidScroll(scrollView: UIScrollView) {
        loadVisiblePages()
    }

}

class CustomFavTableViewCell: UITableViewCell {

}
