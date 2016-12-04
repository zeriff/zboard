class UserStates extends React.Component {
    render() {
        return (
            <div className="ui mini statistics">
                <div className="ui statistic">
                    <div className="label">Pins</div>
                    <div className="value">12</div>
                </div>
                <div className="ui statistic">
                    <div className="label">Followers</div>
                    <div className="value">1222</div>
                </div>
                <div className="ui statistic">
                    <div className="label">Follows</div>
                    <div className="value">110</div>
                </div>
            </div>
        )
    }
}

// %div.ui.mini.statistics
//   %div.ui.mini.statistic
//     %div.label
//       Pins
//     %div.value
//       = link_to user.pins.count, user_pins_path(user.username)
//   %div.ui.mini.statistic
//     %div.label
//       Followers
//     %div.value
//       = link_to user.followers_count, follower_list_path(user.username)
//   %div.ui.mini.statistic
//     %div.label
//       Follows
//     %div.value
//       = link_to user.following_users_count, follow_list_path(user.username)
