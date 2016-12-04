class UserProfile extends React.Component {
    constructor(props) {
        super(props)
    }
    render() {
        let coverStyle = {
            backgroundImage: 'url(' + this.props.user.cover.url + ')',
            backgroundRepeat: 'no-repeat',
            backgroundSize: 'cover',
            backgroundPosition: '3% 15%'
        }
        let dpStyle = {
            backgroundImage: 'url(' + this.props.user.avatar.url + ')',
            backgroundRepeat: 'no-repeat',
            backgroundSize: 'cover',
            backgroundPosition: 'top'
        }
        return (
            <div className="ui container">
                <div className="ui two column centered stackable grid">
                    <div className="fifteen wide column">
                        <div className="cover ui segment" style={coverStyle}>
                            <div className="ui three column centered stackable grid">
                                <div className="twelve wide column"></div>
                                <div className="four wide column dp">
                                    <div className="dp ui segment" style={dpStyle}></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="ui two column centered stackable grid">
                    <div className="fifteen wide column">
                        <div className="ui three column mobile reversed centered stackable grid">
                            <div className="nine wide column"></div>
                            <div className="six wide column"></div>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}
//
// .dp.ui.segment{style: "background-image: url('#{user.avatar.thumb.url.to_s}'); background-repeat: no-repeat;  background-size: cover; background-position: top"}
