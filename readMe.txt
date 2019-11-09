
# M
    * GitHubUser.swift
        * model file for showing GitHub user profile
        * i created minimum 3 properties only for this exercise
        * i using SwiftyJSON lib to convert json to instance of model
# V
    * GitHubUsersListCell.xib
        * view for showing cell
    * Main.storyboard
        * contains view of GitHubUsersListViewController
# VM
    * GitHubUsersListViewModel.swift
        * do one job to call api to fetch all user from github api
        * then, return to property "users" in this view-model
        * then, using closure to notice vc whose using this view-model to update users data
# C
    * GitHubUsersListViewController.swift
        * only responsibility is to setup tableview
        * make sure data from view-model after fetching will be rendered on cell
    * GitHubUsersListCell.swift
        * to setup UI of this cell, and bring data to related components
