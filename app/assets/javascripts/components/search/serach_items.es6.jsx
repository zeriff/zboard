class SearchItems extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidUpdate() {
        masonry.reload('pins');
    }

    componentDidMount() {
        masonry.bind('pins', 'box')
    }
    _renderItems() {
        return this.props.searchitems.map(function(item) {
            return (
                <div key={Math.random()} className="box">
                    <div className="ui centered raised link card">
                        <div className="image">
                            <a href={item.ref}>
                                <img src={item.img} className="ui fluid image"></img>
                            </a>
                        </div>
                        <div className="content">
                            <div className="description">
                                {item.title.substr(0, 45) + "..."}
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
                <div className="pins transitions-enabled">
                    {this._renderItems()}
                </div>
            </div>
        )
    }
}