class User extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className="box user">
                <div className="ui centered raised card">
                    <div className="image">
                        <a href={this.props.user.username}>
                            <img className="ui image fluid" src={this.props.user.avatar.url}></img>
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
