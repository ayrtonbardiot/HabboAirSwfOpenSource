// by nota

//com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorItem

package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3240;
    import flash.geom.ColorTransform;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.window.components.ITextWindow;

    public class PlayListEditorItem 
    {

        public static const ICON_STATE_NORMAL:String = "PLEI_ICON_STATE_NORMAL";
        public static const ICON_STATE_PLAYING:String = "PLEI_ICON_STATE_PLAYING";
        private static const BG_COLOR_SELECTED:uint = 14283002;
        private static const BG_COLOR_UNSELECTED:uint = 0xF1F1F1;

        private var _SafeStr_4981:PlayListEditorWidget;
        private var _window:_SafeStr_3133;
        private var _removeButton:_SafeStr_3240 = null;
        private var _SafeStr_5882:ColorTransform;

        public function PlayListEditorItem(_arg_1:PlayListEditorWidget, _arg_2:String, _arg_3:String, _arg_4:ColorTransform)
        {
            _SafeStr_4981 = _arg_1;
            _SafeStr_5882 = _arg_4;
            createWindow();
            setIconState("PLEI_ICON_STATE_NORMAL");
            deselect();
            trackName = _arg_2;
            trackAuthor = _arg_3;
            diskColor = _arg_4;
        }

        public function get window():_SafeStr_3109
        {
            return (_window as _SafeStr_3109);
        }

        public function get removeButton():_SafeStr_3240
        {
            return (_removeButton);
        }

        private function createWindow():void
        {
            var _local_3:* = null;
            if (_SafeStr_4981 == null)
            {
                return;
            };
            var _local_2:XmlAsset = (_SafeStr_4981.assets.getAssetByName("playlisteditor_playlist_item") as XmlAsset);
            _window = (_SafeStr_4981.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            if (_window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            _local_3 = (_SafeStr_4981.assets.getAssetByName("icon_arrow_left") as BitmapDataAsset);
            if (_local_3 != null)
            {
                if (_local_3.content != null)
                {
                    this.buttonRemoveBitmap = (_local_3.content as BitmapData);
                };
            };
            assignAssetByNameToElement("jb_icon_disc", (_window.getChildByName("song_name_icon_bitmap") as _SafeStr_3264));
            assignAssetByNameToElement("jb_icon_composer", (_window.getChildByName("author_name_icon_bitmap") as _SafeStr_3264));
            var _local_1:_SafeStr_3133 = (_window.getChildByName("action_buttons") as _SafeStr_3133);
            if (_local_1 != null)
            {
                _local_1 = (_local_1.getChildByName("button_border") as _SafeStr_3133);
                if (_local_1 != null)
                {
                    _removeButton = (_local_1.getChildByName("button_remove_from_playlist") as _SafeStr_3240);
                };
            };
        }

        public function select():void
        {
            var _local_2:_SafeStr_3195 = (_window.getChildByName("background") as _SafeStr_3195);
            if (_local_2 != null)
            {
                _local_2.color = 14283002;
            };
            var _local_3:_SafeStr_3133 = (_window.getChildByName("action_buttons") as _SafeStr_3133);
            if (_local_3 != null)
            {
                _local_3.visible = true;
            };
            var _local_1:_SafeStr_3195 = (_window.getChildByName("selected") as _SafeStr_3195);
            if (_local_1 != null)
            {
                _local_1.visible = true;
            };
        }

        public function deselect():void
        {
            var _local_2:_SafeStr_3195 = (_window.getChildByName("background") as _SafeStr_3195);
            if (_local_2 != null)
            {
                _local_2.color = 0xF1F1F1;
            };
            var _local_3:_SafeStr_3133 = (_window.getChildByName("action_buttons") as _SafeStr_3133);
            if (_local_3 != null)
            {
                _local_3.visible = false;
            };
            var _local_1:_SafeStr_3195 = (_window.getChildByName("selected") as _SafeStr_3195);
            if (_local_1 != null)
            {
                _local_1.visible = false;
            };
        }

        public function setIconState(_arg_1:String):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            switch (_arg_1)
            {
                case "PLEI_ICON_STATE_NORMAL":
                    diskColor = _SafeStr_5882;
                    return;
                case "PLEI_ICON_STATE_PLAYING":
                    _local_3 = (_SafeStr_4981.assets.getAssetByName("icon_notes_small") as BitmapDataAsset);
                    if (_local_3 == null)
                    {
                        return;
                    };
                    if (_local_3.content != null)
                    {
                        _local_2 = (_local_3.content as BitmapData);
                        this.diskIconBitmap = _local_2.clone();
                    };
                    return;
            };
        }

        public function set diskColor(_arg_1:ColorTransform):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:BitmapDataAsset = (_SafeStr_4981.assets.getAssetByName("icon_cd_small") as BitmapDataAsset);
            if (_local_3 == null)
            {
                return;
            };
            if (_local_3.content != null)
            {
                _local_2 = (_local_3.content as BitmapData);
                _local_4 = _local_2.clone();
                if (_local_4 != null)
                {
                    _local_4.colorTransform(_local_2.rect, _arg_1);
                    this.diskIconBitmap = _local_4;
                };
            };
        }

        public function set trackName(_arg_1:String):void
        {
            var _local_2:ITextWindow = (_window.getChildByName("song_title_text") as ITextWindow);
            if (_local_2 != null)
            {
                _local_2.text = _arg_1;
            };
        }

        public function set trackAuthor(_arg_1:String):void
        {
            var _local_2:ITextWindow = (_window.getChildByName("song_author_text") as ITextWindow);
            if (_local_2 != null)
            {
                _local_2.text = _arg_1;
            };
        }

        private function set diskIconBitmap(_arg_1:BitmapData):void
        {
            var _local_2:_SafeStr_3264 = (_window.getChildByName("disk_image") as _SafeStr_3264);
            if (_local_2 != null)
            {
                _local_2.bitmap = _arg_1;
            };
        }

        private function set buttonRemoveBitmap(_arg_1:BitmapData):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3133 = (_window.getChildByName("action_buttons") as _SafeStr_3133);
            if (_local_2 == null)
            {
                return;
            };
            _local_2 = (_local_2.getChildByName("button_border") as _SafeStr_3133);
            if (_local_2 == null)
            {
                return;
            };
            _local_2 = (_local_2.getChildByName("button_remove_from_playlist") as _SafeStr_3133);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:_SafeStr_3264 = (_local_2.getChildByName("button_remove_from_playlist_image") as _SafeStr_3264);
            if (_local_3 != null)
            {
                _local_3.bitmap = _arg_1.clone();
                _local_3.width = _arg_1.width;
                _local_3.height = _arg_1.height;
            };
        }

        private function assignAssetByNameToElement(_arg_1:String, _arg_2:_SafeStr_3264):void
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


    }
}//package com.sulake.habbo.ui.widget.playlisteditor

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5882 = "_-s5" (String#1584, DoABC#4)


