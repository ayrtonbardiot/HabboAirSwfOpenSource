// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.playlisteditor.PlayListStatusView

package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components._SafeStr_3240;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class PlayListStatusView 
    {

        public static const ADD_SONGS:String = "PLSV_ADD_SONGS";
        public static const START_PLAYBACK:String = "PLSV_START_PLAYBACK";
        public static const NOW_PLAYING:String = "PLSV_NOW_PLAYING";

        private var _container:_SafeStr_3133;
        private var _SafeStr_6739:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_4981:PlayListEditorWidget;
        private var _SafeStr_4494:String;

        public function PlayListStatusView(_arg_1:PlayListEditorWidget, _arg_2:_SafeStr_3133)
        {
            _container = _arg_2;
            _SafeStr_4981 = _arg_1;
            createWindows();
        }

        public function destroy():void
        {
            for each (var _local_1:_SafeStr_3133 in _SafeStr_6739.getValues())
            {
                _local_1.destroy();
            };
            _SafeStr_6739 = null;
        }

        public function selectView(_arg_1:String):void
        {
            _container.removeChildAt(0);
            _container.addChildAt((_SafeStr_6739[_arg_1] as _SafeStr_3133), 0);
            _SafeStr_4494 = _arg_1;
        }

        public function set nowPlayingTrackName(_arg_1:String):void
        {
            if (_SafeStr_4494 != "PLSV_NOW_PLAYING")
            {
                return;
            };
            var _local_2:_SafeStr_3133 = _SafeStr_6739[_SafeStr_4494];
            var _local_3:ITextWindow = (_local_2.getChildByName("now_playing_track_name") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.text = _arg_1;
            };
        }

        public function set nowPlayingAuthorName(_arg_1:String):void
        {
            if (_SafeStr_4494 != "PLSV_NOW_PLAYING")
            {
                return;
            };
            var _local_2:_SafeStr_3133 = _SafeStr_6739[_SafeStr_4494];
            var _local_3:ITextWindow = (_local_2.getChildByName("now_playing_author_name") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.text = _arg_1;
            };
        }

        public function set addSongsBackgroundImage(_arg_1:BitmapData):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3133 = _SafeStr_6739["PLSV_ADD_SONGS"];
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:_SafeStr_3264 = (_local_2.getChildByName("background_image") as _SafeStr_3264);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.bitmap = _arg_1.clone();
            _local_3.width = _arg_1.width;
            _local_3.height = _arg_1.height;
        }

        private function createWindows():void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_1:* = null;
            _local_2 = (_SafeStr_4981.assets.getAssetByName("playlisteditor_playlist_subwindow_add_songs") as XmlAsset);
            _local_3 = (_SafeStr_4981.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            if (_local_3 != null)
            {
                _SafeStr_6739.add("PLSV_ADD_SONGS", _local_3);
            };
            _local_2 = (_SafeStr_4981.assets.getAssetByName("playlisteditor_playlist_subwindow_play_now") as XmlAsset);
            _local_3 = (_SafeStr_4981.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            if (_local_3 != null)
            {
                _SafeStr_6739.add("PLSV_START_PLAYBACK", _local_3);
                _local_4 = (_local_3.getChildByName("play_now_button") as _SafeStr_3122);
                _local_4.addEventListener("WME_CLICK", onPlayPauseClicked);
            };
            _local_2 = (_SafeStr_4981.assets.getAssetByName("playlisteditor_playlist_subwindow_nowplaying") as XmlAsset);
            _local_3 = (_SafeStr_4981.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            if (_local_3 != null)
            {
                _SafeStr_6739.add("PLSV_NOW_PLAYING", _local_3);
                _local_1 = (_local_3.getChildByName("button_pause") as _SafeStr_3240);
                _local_1.addEventListener("WME_CLICK", onPlayPauseClicked);
                assignAssetToElement("icon_pause_large", (_local_1.getChildByName("pause_image") as _SafeStr_3264));
                assignAssetToElement("jb_icon_disc", (_local_3.getChildByName("song_name_icon_bitmap") as _SafeStr_3264));
                assignAssetToElement("jb_icon_composer", (_local_3.getChildByName("author_name_icon_bitmap") as _SafeStr_3264));
            };
        }

        private function assignAssetToElement(_arg_1:String, _arg_2:_SafeStr_3264):void
        {
            var _local_3:* = null;
            var _local_4:BitmapDataAsset = (_SafeStr_4981.assets.getAssetByName(_arg_1) as BitmapDataAsset);
            if (_local_4 != null)
            {
                if (((!(_arg_2 == null)) && (!(_local_4.content == null))))
                {
                    _local_3 = (_local_4.content as BitmapData);
                    _arg_2.bitmap = _local_3.clone();
                };
            };
        }

        private function onPlayPauseClicked(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.sendTogglePlayPauseStateMessage();
        }


    }
}//package com.sulake.habbo.ui.widget.playlisteditor

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4494 = "_-LI" (String#1588, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6739 = "_-027" (String#3420, DoABC#4)


