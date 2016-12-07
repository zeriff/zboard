class Pin extends React.Component {
    render() {
        return (
            <div className="box">
                <div className="ui fluid centered raised link card">
                    <div className="image">
                        <a href={"/pins/" + this.props.pin.id}>
                            <img src={this.props.pin.image.thumb.url} className="ui fluid image"></img>
                        </a>
                    </div>
                    <div className="content">
                        <img className="mavatar ui avatar right floated image" src={this.props.pin.user.avatar.mini.url}></img>
                        <a className="header" href={"/users/" + this.props.pin.user.username}>
                            {this.props.pin.user.username}
                        </a>
                        <div className="meta">
                            <span className="date">
                                {new Date(this.props.pin.created_at).toDateString()}
                            </span>
                        </div>
                        <div className="description">
                            {this.props.pin.title.substr(0, 45) + "..."}
                        </div>
                    </div>
                    <div className="extra content">
                        <LikeButton pin={this.props.pin}></LikeButton>
                        <SaveButton pin={this.props.pin}></SaveButton>
                    </div>
                </div>
            </div>
        )
    }
}
