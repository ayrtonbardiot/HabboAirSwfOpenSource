// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryGridItem

package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3240;
    import flash.geom.ColorTransform;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.window.components.ITextWindow;

    public class MusicInventoryGridItem 
    {

        public static const _SafeStr_9075:int = 0;
        public static const _SafeStr_9076:int = 1;
        public static const BUTTON_STATE_DOWNLOAD:int = 2;
        private static const BG_COLOR_SELECTED:uint = 14612159;
        private static const BG_COLOR_UNSELECTED:uint = 0xF1F1F1;

        private var _SafeStr_4981:PlayListEditorWidget;
        private var _window:_SafeStr_3133 = null;
        private var _SafeStr_5858:int;
        private var _SafeStr_4222:int;
        private var _toPlayListButton:_SafeStr_3240 = null;
        private var _SafeStr_6939:int;

        public function MusicInventoryGridItem(_arg_1:PlayListEditorWidget, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:ColorTransform)
        {
            _SafeStr_4981 = _arg_1;
            _SafeStr_5858 = _arg_2;
            _SafeStr_4222 = _arg_3;
            createWindow();
            deselect();
            if (((!(_arg_4 == null)) && (!(_arg_5 == null))))
            {
                trackName = _arg_4;
                diskColor = _arg_5;
            };
        }

        public function get window():_SafeStr_3109
        {
            return (_window as _SafeStr_3109);
        }

        public function get diskId():int
        {
            return (_SafeStr_5858);
        }

        public function get songId():int
        {
            return (_SafeStr_4222);
        }

        public function get toPlayListButton():_SafeStr_3240
        {
            return (_toPlayListButton);
        }

        public function get playButtonState():int
        {
            return (_SafeStr_6939);
        }

        public function update(_arg_1:int, _arg_2:String, _arg_3:ColorTransform):void
        {
            if (_arg_1 == _SafeStr_4222)
            {
                trackName = _arg_2;
                diskColor = _arg_3;
            };
        }

        public function destroy():void
        {
            if (_window)
            {
                _window.destroy();
            };
        }

        private function createWindow():void
        {
            var _local_3:* = null;
            if (_SafeStr_4981 == null)
            {
                return;
            };
            var _local_2:XmlAsset = (_SafeStr_4981.assets.getAssetByName("playlisteditor_music_inventory_item") as XmlAsset);
            _window = (_SafeStr_4981.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            if (_window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            var _local_1:_SafeStr_3133 = (_window.getChildByName("action_buttons") as _SafeStr_3133);
            if (_local_1 != null)
            {
                _toPlayListButton = (_local_1.getChildByName("button_to_playlist") as _SafeStr_3240);
            };
            assignAssetByNameToElement("title_fader", (_window.getChildByName("title_fader_bitmap") as _SafeStr_3264));
            _local_3 = (_SafeStr_4981.assets.getAssetByName("icon_arrow") as BitmapDataAsset);
            if (_local_3 != null)
            {
                if (_local_3.content != null)
                {
                    this.buttonToPlaylistBitmap = (_local_3.content as BitmapData);
                };
            };
            this.playButtonState = 0;
        }

        public function select():void
        {
            var _local_2:_SafeStr_3195 = (_window.getChildByName("background") as _SafeStr_3195);
            if (_local_2 != null)
            {
                _local_2.color = 14612159;
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

        public function set diskColor(_arg_1:ColorTransform):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:BitmapDataAsset = (_SafeStr_4981.assets.getAssetByName("icon_cd_big") as BitmapDataAsset);
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

        public function set playButtonState(_arg_1:int):void
        {
            var _local_2:* = null;
            if (_arg_1 == 0)
            {
                _local_2 = (_SafeStr_4981.assets.getAssetByName("icon_play") as BitmapDataAsset);
            }
            else
            {
                if (_arg_1 == 1)
                {
                    _local_2 = (_SafeStr_4981.assets.getAssetByName("icon_pause") as BitmapDataAsset);
                }
                else
                {
                    if (_arg_1 == 2)
                    {
                        _local_2 = (_SafeStr_4981.assets.getAssetByName("icon_download") as BitmapDataAsset);
                    };
                };
            };
            if (_local_2 != null)
            {
                if (_local_2.content != null)
                {
                    this.buttonPlayPauseBitmap = (_local_2.content as BitmapData);
                };
            };
            _SafeStr_6939 = _arg_1;
        }

        public function set trackName(_arg_1:String):void
        {
            var _local_2:ITextWindow = (_window.getChildByName("song_title_text") as ITextWindow);
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

        private function set buttonToPlaylistBitmap(_arg_1:BitmapData):void
        {
            assignBitmapDataToButton("button_to_playlist", "image_button_to_playlist", _arg_1);
        }

        private function set buttonPlayPauseBitmap(_arg_1:BitmapData):void
        {
            assignBitmapDataToButton("button_play_pause", "image_button_play_pause", _arg_1);
        }

        private function assignBitmapDataToButton(_arg_1:String, _arg_2:String, _arg_3:BitmapData):void
        {
            if (_arg_3 == null)
            {
                return;
            };
            var _local_4:_SafeStr_3133 = (_window.getChildByName("action_buttons") as _SafeStr_3133);
            if (_local_4 == null)
            {
                return;
            };
            _local_4 = (_local_4.getChildByName(_arg_1) as _SafeStr_3133);
            if (_local_4 == null)
            {
                return;
            };
            var _local_5:_SafeStr_3264 = (_local_4.getChildByName(_arg_2) as _SafeStr_3264);
            if (_local_5 != null)
            {
                _local_5.bitmap = _arg_3.clone();
                _local_5.width = _arg_3.width;
                _local_5.height = _arg_3.height;
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
// _SafeStr_4222 = "_-Tb" (String#2462, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5858 = "_-v1K" (String#9001, DoABC#4)
// _SafeStr_6939 = "_-Xu" (String#19314, DoABC#4)
// _SafeStr_9075 = "_-f1c" (String#37996, DoABC#4)
// _SafeStr_9076 = "_-tH" (String#34392, DoABC#4)


