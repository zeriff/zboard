class PinTest extends React.Component {
    constructor(props) {
        super(props)
    }

    componentDidMount() {
        // $('.pintest .image').dimmer({on: 'hover'});
    }

    render() {
        return (
            <div className="pintest">
                <div className="ui fluid raised link card">
                    <a className="blurring dimmable image" href={"/pins/" + this.props.pin.id}>
                        <img src={this.props.pin.image.url}></img>
                    </a>
                    <div className="content">
                        <span className="right floated likebutton">
                            <LikeButton pin ={this.props.pin}></LikeButton>
                        </span>
                        <div className="pintitle">
                            {this.props.pin.title.substr(0, 40).toUpperCase()}
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}
