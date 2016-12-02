class SearchArea extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            pins: [],
            query: "",
            loading: "idle"
        }
    }
    componentDidMount() {
        $('.ui.dropdown').dropdown({transition: 'fade up'});
    }
    emitSearch() {
        var me = this;
        this.setState({loading: "loading"});
        axios.get('/find/' + this.state.query).then(function(res) {
            setTimeout(function() {
                me.setState({pins: res.data, loading: "idle"})
            }, 2000)
        });
    }
    _onKeyUp(e) {
        this.setState({pins: [], query: e.target.value});
        e.keyCode === 13 && this.emitSearch();
    }
    render() {
        let pins = this.state.pins;
        let items = ("");

        if (this.state.loading == 'loading') {
            items = (
                <div className="ui active centered inline loader"></div>
            )
        } else {
            items = (
                <SearchItems searchitems={pins}></SearchItems>
            )
        }
        return (
            <div>
                <div className="ui two column center aligned stackable grid">
                    <div className="eight wide column">
                        <div className="ui vertical segment center aligned">
                            <div className="ui right fluid left icon input big">
                                <i className="search icon"/>
                                <input type="text" onKeyUp={this._onKeyUp.bind(this)} placeholder="Search..." autoFocus/>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="ui divider"></div>
                {items}
            </div>
        );
    }
}
