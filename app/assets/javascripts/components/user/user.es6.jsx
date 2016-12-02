class User extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        let avatarurl = ""
        if (this.props.user.avatar.mini.url) {
            avatarurl = this.props.user.avatar.mini.url;
        } else {
            if (this.props.user.gender == 0) {
                avatarurl = "https://s3.ap-south-1.amazonaws.com/zboarddefaults/boy.png";
            } else {
                avatarurl = "https://s3.ap-south-1.amazonaws.com/zboarddefaults/girl.png";
            }

        }

        return (
            <div className="box user">
                <div className="ui centered raised card">
                    <div className="image">
                        <a href={this.props.user.username}>
                            <img className="ui image fluid" src={avatarurl}></img>
                        </a>
                    </div>
                    <div className="content">
                        <div className="header">
                            {this.props.user.username}
                        </div>
                        <div className="description">
                            {this.props.user.about}
                        </div>
                        <div className="meta">
                            {this.props.user.location}
                        </div>
                        <div className="ui horizontal divider">
                            <FollowButton user={this.props.user}></FollowButton>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}
