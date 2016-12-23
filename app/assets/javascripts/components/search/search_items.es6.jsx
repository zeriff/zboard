class SearchItems extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidUpdate() {
        if (this.props.searchitems.length > 0) {
            masonry.reload('pins');
        }
    }

    componentDidMount() {
        masonry.bind('pins', 'box')
    }
    _renderItems() {
        return this.props.searchitems.map(function(item) {
            return (
                <div key={Math.random()} className="box">
                    <div className="ui centered raised link fluid card">
                        <div className="fluid image">
                            <a href={item.ref}>
                                <img src={item.img} className="ui fluid image"></img>
                            </a>
                        </div>
                        <div className="content">
                            <div className="pintitle">
                                {item.title.substr(0, 40).toUpperCase()}
                            </div>
                        </div>
                    </div>
                </div>
            )
        })

    }

    render() {
        return (
            <div>
                <div className="pins transitions-enabled" style={{
                    margin: "auto"
                }}>
                    {this._renderItems()}
                </div>
            </div>
        )
    }
}
