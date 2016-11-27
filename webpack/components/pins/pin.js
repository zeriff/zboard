import React from 'react';
export default class Pin extends React.Component {
    constructor(props) {
        super(props);
        this.divStyle = {
            padding: '5px',
            width: '280px'
        };
    }

    render() {
        return (
            <div className="box" style={this.divStyle}>
                <div className="ui centered raised link fluid card">
                    <div className="image">
                        <a href={'pins/' + this.props.id}>
                            <img className="ui image fluid" src={this.props.image.thumb.url}></img>
                        </a>
                    </div>
                    <div className="content">
                        <img className="mavatar ui avatar right floated image" src={this.props.user.avatar.mini.url}></img>
                        <b>
                            {this.props.user.username}
                        </b>
                        <div className="meta">
                            <span className="date">
                                {new Date(this.props.created_at).toDateString()}
                            </span>
                        </div>
                        <div className="description">
                            {this.props.title.substr(0, 32) + "..."}
                        </div>
                    </div>
                    <div className="extra content">
                        <span></span>
                    </div>
                </div>
            </div>
        )
    }
}
