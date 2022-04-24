// by nota

//com.sulake.habbo.ui.widget.furniture.video.YoutubeDisplayWidget

package com.sulake.habbo.ui.widget.furniture.video
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.ui.handler._SafeStr_3306;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.display.LoaderInfo;
    import com.sulake.core.window.components._SafeStr_3189;
    import flash.events.Event;
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-z1k._SafeStr_1622;
    import __AS3__.vec.Vector;

    public class YoutubeDisplayWidget extends RoomWidgetBase 
    {

        private static const _SafeStr_9031:uint = 4291611903;
        private static const _SafeStr_9032:uint = 0xFFFFFFFF;

        private var _habboTracking:_SafeStr_1704;
        private var _SafeStr_4136:Object;
        private var _window:_SafeStr_3133;
        private var _roomObject:IRoomObject;
        private var _SafeStr_4859:_SafeStr_3133;
        private var _SafeStr_4858:_SafeStr_3109;
        private var _queuedVideoParams:Object;
        private var _SafeStr_4856:String;
        private var _canControlPlayback:Boolean;
        private var _SafeStr_4857:int = -1;

        public function YoutubeDisplayWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18, _arg_5:_SafeStr_1704)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _habboTracking = _arg_5;
            ownHandler.widget = this;
        }

        private function get ownHandler():_SafeStr_3306
        {
            return (_SafeStr_3914 as _SafeStr_3306);
        }

        override public function get mainWindow():_SafeStr_3109
        {
            return (_window);
        }

        public function show(_arg_1:IRoomObject, _arg_2:Boolean):void
        {
            _roomObject = _arg_1;
            _canControlPlayback = _arg_2;
            createWindow(_arg_2);
            _window.visible = true;
        }

        private function createWindow(_arg_1:Boolean):void
        {
            if (_window != null)
            {
                return;
            };
            _window = (windowManager.buildFromXML(XML(assets.getAssetByName("video_viewer_xml").content)) as _SafeStr_3133);
            if (_arg_1)
            {
                _SafeStr_4858 = IItemListWindow(_window.findChildByName("playlists")).removeListItemAt(0);
            }
            else
            {
                _window.findChildByName("right_pane").dispose();
                _window.findChildByName("video_background").width = (_window.width - 20);
                _window.findChildByName("video_background").setParamFlag(128);
                _window.width = (_window.width - 250);
            };
            _window.procedure = windowProcedure;
            _window.center();
        }

        private function onPlayerLoaderInit(_arg_1:Event):void
        {
            var _local_2:* = null;
            if (_window == null)
            {
                return;
            };
            var _local_3:LoaderInfo = (_arg_1.target as LoaderInfo);
            if (_local_3)
            {
                _local_2 = _local_3.loader;
                _SafeStr_3189(_window.findChildByName("video_wrapper")).setDisplayObject(_local_2);
                _local_2.content.addEventListener("onReady", onPlayerReady);
                _local_2.content.addEventListener("onStateChange", onPlayerStateChange);
                _local_2.content.addEventListener("mouseUp", onVideoMouseEvent);
                _local_2.content.addEventListener("mouseMove", onVideoMouseEvent);
            };
        }

        private function onVideoMouseEvent(_arg_1:MouseEvent):void
        {
            if (((!(_window == null)) && (_canControlPlayback)))
            {
                DisplayObject(_arg_1.target).stage.dispatchEvent(new MouseEvent(_arg_1.type));
                if ((((_SafeStr_4136) && (_arg_1.type == "mouseUp")) && (!(_SafeStr_4856 == ""))))
                {
                    if (_SafeStr_4136.getPlayerState() == 1)
                    {
                        ownHandler.pauseVideo(_roomObject.getId());
                    }
                    else
                    {
                        if (_SafeStr_4136.getPlayerState() == 2)
                        {
                            ownHandler.continueVideo(_roomObject.getId());
                        };
                    };
                };
            };
        }

        private function onPlayerReady(_arg_1:Event):void
        {
            var _local_2:* = null;
            _SafeStr_4136 = _arg_1.target;
            if (_window != null)
            {
                _local_2 = _window.findChildByName("video_wrapper");
                _SafeStr_4136.setSize(_local_2.width, _local_2.height);
                if (_queuedVideoParams != null)
                {
                    loadVideo(_queuedVideoParams);
                    _queuedVideoParams = null;
                };
            }
            else
            {
                _SafeStr_4136.destroy();
            };
        }

        private function onPlayerStateChange(_arg_1:Event):void
        {
            _SafeStr_4136 = _arg_1.target;
            if (_window != null)
            {
                switch (_SafeStr_4136.getPlayerState())
                {
                    case -1:
                    case 1:
                        if (_SafeStr_4857 == 2)
                        {
                            _SafeStr_4136.pauseVideo();
                        };
                        return;
                };
            };
        }

        public function hide(_arg_1:IRoomObject):void
        {
            if (_roomObject != _arg_1)
            {
                return;
            };
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_4858 != null)
            {
                _SafeStr_4858.dispose();
                _SafeStr_4858 = null;
            };
            if (_SafeStr_4136 != null)
            {
                _SafeStr_4136.destroy();
                _SafeStr_4136 = null;
            };
            if (_SafeStr_4856 != null)
            {
                _habboTracking.trackEventLog("YouTubeTVs", _SafeStr_4856, "video.closed");
            };
            _queuedVideoParams = null;
            _SafeStr_4859 = null;
            _roomObject = null;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            hide(_roomObject);
            _habboTracking = null;
            super.dispose();
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_5:* = null;
            var _local_6:int;
            var _local_3:int;
            var _local_8:* = null;
            var _local_9:* = null;
            var _local_7:int;
            var _local_4:* = null;
            switch (_arg_1.type)
            {
                case "WME_CLICK":
                    switch (_arg_2.name)
                    {
                        case "header_button_close":
                            hide(_roomObject);
                            break;
                        case "playlist_prev":
                            ownHandler.switchToPreviousVideo(_roomObject.getId());
                            break;
                        case "playlist_next":
                            ownHandler.switchToNextVideo(_roomObject.getId());
                            break;
                        default:
                            if ((_arg_2 is IRegionWindow))
                            {
                                if (_SafeStr_4859 != null)
                                {
                                    _SafeStr_4859.findChildByName("item_background").color = 0xFFFFFFFF;
                                };
                                if (_SafeStr_4859 == _arg_2)
                                {
                                    _SafeStr_4859 = null;
                                    ownHandler.selectPlaylist(_roomObject.getId(), "");
                                }
                                else
                                {
                                    _SafeStr_4859 = (_arg_2 as _SafeStr_3133);
                                    _SafeStr_4859.findChildByName("item_background").color = 4291611903;
                                    ownHandler.selectPlaylist(_roomObject.getId(), _SafeStr_4859.name);
                                };
                                updateButtons();
                            };
                    };
                    return;
                case "WE_RESIZE":
                    switch (_arg_2.name)
                    {
                        case "video_viewer":
                            if (_window != null)
                            {
                                _local_5 = _window.findChildByName("right_pane");
                                if (_local_5 != null)
                                {
                                    _local_6 = (_window.width - 29);
                                    _local_3 = (_local_6 * 0.66);
                                    _local_8 = _window.findChildByName("video_background");
                                    _local_8.width = _local_3;
                                    _local_5.x = (_local_8.right + 9);
                                    _local_5.width = (_local_6 - _local_3);
                                };
                            };
                            break;
                        case "playlists":
                            _local_9 = (_arg_2 as IItemListWindow);
                            if (_local_9 != null)
                            {
                                _local_7 = 0;
                                while (_local_7 < _local_9.numListItems)
                                {
                                    _local_4 = (_local_9.getListItemAt(_local_7) as _SafeStr_3133);
                                    _local_4.findChildByName("item_background").width = _local_9.width;
                                    _local_4.findChildByName("item_contents").width = _local_9.width;
                                    _local_4.findChildByName("item_description").width = (_local_9.width - 22);
                                    _local_7++;
                                };
                            };
                            break;
                        case "video_wrapper":
                            if (_SafeStr_4136 != null)
                            {
                                _SafeStr_4136.setSize(_arg_2.width, _arg_2.height);
                            };
                    };
                    return;
            };
        }

        public function showVideo(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            if (((_roomObject == null) || (!(_roomObject.getId() == _arg_1))))
            {
                return;
            };
            var _local_6:Object = (((_arg_3 > 0) || (_arg_4 > 0)) ? {
    "videoId":_arg_2,
    "startSeconds":_arg_3,
    "endSeconds":_arg_4,
    "suggestedQuality":"large"
} : {
    "videoId":_arg_2,
    "suggestedQuality":"large"
});
            if (_SafeStr_4136 != null)
            {
                loadVideo(_local_6);
                _queuedVideoParams = null;
            }
            else
            {
                _queuedVideoParams = _local_6;
            };
            _SafeStr_4857 = _arg_5;
        }

        public function controlVideo(_arg_1:int, _arg_2:int):void
        {
            if (((_roomObject == null) || (!(_roomObject.getId() == _arg_1))))
            {
                return;
            };
            if (_window != null)
            {
                if (_SafeStr_4136)
                {
                    switch (_arg_2)
                    {
                        case 1:
                            _SafeStr_4857 = 1;
                            _SafeStr_4136.playVideo();
                            return;
                        case 2:
                            _SafeStr_4857 = 2;
                            _SafeStr_4136.pauseVideo();
                        default:
                    };
                };
            };
        }

        private function loadVideo(_arg_1:Object):void
        {
            _SafeStr_4856 = _arg_1.videoId;
            var _local_2:* = (!(_SafeStr_4856 == ""));
            if (_local_2)
            {
                _SafeStr_4136.loadVideoById(_arg_1);
                _habboTracking.trackEventLog("YouTubeTVs", _SafeStr_4856, "video.started");
            }
            else
            {
                _SafeStr_4136.stopVideo();
            };
            if (_window != null)
            {
                _window.findChildByName("no_videos_label").visible = (!(_local_2));
                _window.findChildByName("video_wrapper").visible = _local_2;
            };
        }

        public function populatePlaylists(_arg_1:int, _arg_2:Vector.<_SafeStr_1622>, _arg_3:String):void
        {
            var _local_4:* = null;
            if (((((_roomObject == null) || (!(_roomObject.getId() == _arg_1))) || (_window == null)) || (_SafeStr_4858 == null)))
            {
                return;
            };
            var _local_6:IItemListWindow = (_window.findChildByName("playlists") as IItemListWindow);
            if (_local_6 == null)
            {
                return;
            };
            _local_6.destroyListItems();
            _SafeStr_4859 = null;
            for each (var _local_5:_SafeStr_1622 in _arg_2)
            {
                _local_4 = (_SafeStr_4858.clone() as _SafeStr_3133);
                _local_4.name = _local_5.playlistId;
                _local_4.findChildByName("item_background").width = _local_6.width;
                if (_local_5.playlistId == _arg_3)
                {
                    _local_4.findChildByName("item_background").color = 4291611903;
                    _SafeStr_4859 = _local_4;
                };
                _local_4.findChildByName("item_contents").width = _local_6.width;
                _local_4.findChildByName("item_title").caption = _local_5.title;
                _local_4.findChildByName("item_description").caption = _local_5.description.replace(/\r/g, "");
                _local_4.findChildByName("item_description").width = (_local_6.width - 22);
                _local_6.addListItem(_local_4);
            };
            updateButtons();
        }

        private function updateButtons():void
        {
            if (_window == null)
            {
                return;
            };
            if (_SafeStr_4859 != null)
            {
                _window.findChildByName("playlist_prev").enable();
                _window.findChildByName("playlist_next").enable();
            }
            else
            {
                _window.findChildByName("playlist_prev").disable();
                _window.findChildByName("playlist_next").disable();
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.video

// _SafeStr_1622 = "_-Op" (String#31343, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3306 = "_-I1p" (String#11328, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4136 = "_-w1a" (String#2353, DoABC#4)
// _SafeStr_4856 = "_-g1n" (String#9994, DoABC#4)
// _SafeStr_4857 = "_-X1Q" (String#9470, DoABC#4)
// _SafeStr_4858 = "_-Pt" (String#4311, DoABC#4)
// _SafeStr_4859 = "_-JC" (String#1312, DoABC#4)
// _SafeStr_9031 = "_-9P" (String#38731, DoABC#4)
// _SafeStr_9032 = "_-E1j" (String#32393, DoABC#4)


