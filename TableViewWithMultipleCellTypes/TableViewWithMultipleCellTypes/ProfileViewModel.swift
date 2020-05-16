//
//  ProfileViewModel.swift
//  TableViewWithMultipleCellTypes
//
//  Created by Haydn Wiese on 2020-05-15.
//  Copyright © 2020 Haydn Wiese. All rights reserved.
//

import Foundation

enum ProfileViewModelItemType {
    case nameAndPicture
    case about
    case email
    case friend
    case attribute
}

protocol ProfileViewModelItem {
    var type: ProfileViewModelItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String { get }
}

class ProfileViewModel: NSObject {
    var items = [ProfileViewModelItem]()
    
    override init() {
        super.init()
        guard let data = dataFromFile("ServerData"), let profile = Profile(data: data) else {
            return
        }
        
        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
           let nameAndPictureItem = ProfileViewModelNameItem(name: name, pictureUrl: pictureUrl)
           items.append(nameAndPictureItem)
        }
        if let about = profile.about {
           let aboutItem = ProfileViewModelAboutItem(about: about)
           items.append(aboutItem)
        }
        if let email = profile.email {
           let dobItem = ProfileViewModelEmailItem(email: email)
           items.append(dobItem)
        }
        let attributes = profile.profileAttributes
        // we only need attributes item if attributes not empty
        if !attributes.isEmpty {
           let attributesItem = ProfileViewModelAttributeItem(attributes: attributes)
           items.append(attributesItem)
        }
        let friends = profile.friends
        // we only need friends item if friends not empty
        if !profile.friends.isEmpty {
           let friendsItem = ProfileViewModeFriendsItem(friends: friends)
           items.append(friendsItem)
        }
        // initialization code will go here
    }
}

extension ProfileViewModelItem {
    var rowCount: Int {
        return 1
    }
}

class ProfileViewModelNameItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .nameAndPicture
    }
    var sectionTitle: String {
        return "Main Info"
    }
    
    var pictureUrl: String
    var username: String
    
    init(pictureUrl: String, username: String) {
        self.pictureUrl = pictureUrl
        self.username = username
    }
}

class ProfileViewModelAboutItem: ProfileViewModelItem {
   var type: ProfileViewModelItemType {
      return .about
   }
   var sectionTitle: String {
      return "About"
   }
   var about: String
  
   init(about: String) {
      self.about = about
   }
}

class ProfileViewModelEmailItem: ProfileViewModelItem {
   var type: ProfileViewModelItemType {
      return .email
   }
   var sectionTitle: String {
      return "Email"
   }
   var email: String
   init(email: String) {
      self.email = email
   }
}

class ProfileViewModelAttributeItem: ProfileViewModelItem {
   var type: ProfileViewModelItemType {
      return .attribute
   }
   var sectionTitle: String {
    return "Attributes"
   }
 
   var rowCount: Int {
      return attributes.count
   }
   var attributes: [Attribute]
   init(attributes: [Attribute]) {
      self.attributes = attributes
   }
}

class ProfileViewModeFriendsItem: ProfileViewModelItem {
   var type: ProfileViewModelItemType {
      return .friend
   }
   var sectionTitle: String {
      return "Friends"
   }
   var rowCount: Int {
      return friends.count
   }
   var friends: [Friend]
   init(friends: [Friend]) {
      self.friends = friends
   }
}
