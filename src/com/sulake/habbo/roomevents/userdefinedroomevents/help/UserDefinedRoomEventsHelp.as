// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.help.UserDefinedRoomEventsHelp

package com.sulake.habbo.roomevents.userdefinedroomevents.help
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components._SafeStr_3240;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.localization.ILocalization;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;

    public class UserDefinedRoomEventsHelp 
    {

        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _SafeStr_6432:_SafeStr_3133;
        private var _window:_SafeStr_3263;
        private var _SafeStr_3882:_SafeStr_3133;
        private var _SafeStr_4780:int = 0;
        private var _SafeStr_4020:Array;
        private var _SafeStr_6433:_SafeStr_3240;
        private var _buttonPrevious:_SafeStr_3240;

        public function UserDefinedRoomEventsHelp(_arg_1:HabboUserDefinedRoomEvents)
        {
            _roomEvents = _arg_1;
        }

        public function dispose():void
        {
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            };
            initLocalizations();
            _window = _SafeStr_3263(_roomEvents.getXmlWindow("ude_help"));
            _SafeStr_6432 = _SafeStr_3133(find(_window, "help_container"));
            _buttonPrevious = (_SafeStr_6432.findChildByName("button_previous") as _SafeStr_3240);
            if (_buttonPrevious)
            {
                _buttonPrevious.procedure = onButtonClick;
            };
            _SafeStr_6433 = (_SafeStr_6432.findChildByName("button_next") as _SafeStr_3240);
            if (_SafeStr_6433)
            {
                _SafeStr_6433.procedure = onButtonClick;
            };
            var _local_1:_SafeStr_3109 = _window.findChildByTag("close");
            _local_1.procedure = onWindowClose;
            _window.center();
        }

        public function open(_arg_1:int=-1, _arg_2:int=-1):void
        {
            prepareWindow();
            openPage();
            _window.visible = true;
            if (_arg_1 >= 0)
            {
                _window.x = _arg_1;
            };
            if (_arg_2 >= 0)
            {
                _window.y = _arg_2;
            };
        }

        private function onWindowClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                close();
            };
        }

        public function close():void
        {
            if (_window)
            {
                _window.visible = false;
            };
        }

        private function find(_arg_1:_SafeStr_3133, _arg_2:String):_SafeStr_3109
        {
            var _local_3:_SafeStr_3109 = _arg_1.findChildByName(_arg_2);
            if (_local_3 == null)
            {
                throw (new Error((("Window element with name: " + _arg_2) + " cannot be found!")));
            };
            return (_local_3);
        }

        public function toggle():void
        {
            _window.visible = (!(_window.visible));
        }

        private function openPage():void
        {
            localize();
            checkButtons();
        }

        private function checkButtons():void
        {
            if (_SafeStr_4780 >= (_SafeStr_4020.length - 1))
            {
                _SafeStr_6433.disable();
            }
            else
            {
                _SafeStr_6433.enable();
            };
            if (_SafeStr_4780 <= 0)
            {
                _buttonPrevious.disable();
            }
            else
            {
                _buttonPrevious.enable();
            };
        }

        private function nextPage():void
        {
            _SafeStr_4780++;
            _SafeStr_4780 = Math.min(_SafeStr_4780, (_SafeStr_4020.length - 1));
            openPage();
        }

        private function previousPage():void
        {
            _SafeStr_4780--;
            _SafeStr_4780 = Math.max(_SafeStr_4780, 0);
            openPage();
        }

        private function initLocalizations():void
        {
            var _local_1:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            _SafeStr_4020 = [];
            var _local_2:int = 1;
            while (_roomEvents.localization.getLocalizationRaw((("wiredfurni.help." + _local_2) + ".title")))
            {
                _local_1 = _roomEvents.localization.getLocalizationRaw((("wiredfurni.help." + _local_2) + ".title"));
                _local_4 = _roomEvents.localization.getLocalizationRaw((("wiredfurni.help." + _local_2) + ".img"));
                _local_3 = _roomEvents.localization.getLocalizationRaw((("wiredfurni.help." + _local_2) + ".text"));
                _SafeStr_4020.push([_local_1, _local_4, _local_3]);
                _local_2++;
            };
        }

        private function onButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "button_previous":
                        previousPage();
                        return;
                    case "button_next":
                        nextPage();
                        return;
                };
            };
        }

        private function localize():void
        {
            var _local_1:* = null;
            var _local_3:* = null;
            var _local_5:ITextWindow = (find(_window, "help_title") as ITextWindow);
            var _local_4:ITextWindow = (find(_window, "help_text") as ITextWindow);
            var _local_2:_SafeStr_3264 = (find(_window, "help_image") as _SafeStr_3264);
            if (((_SafeStr_4020 == null) || (_SafeStr_4020.length == 0)))
            {
                return;
            };
            if (_local_5)
            {
                _local_1 = ILocalization(_SafeStr_4020[_SafeStr_4780][0]);
                if (_local_1 != null)
                {
                    _local_5.text = _local_1.value;
                };
            };
            if (_local_4)
            {
                _local_1 = ILocalization(_SafeStr_4020[_SafeStr_4780][2]);
                if (_local_1 != null)
                {
                    _local_5.text = _local_1.value;
                };
            };
            if (_local_2)
            {
                _local_1 = ILocalization(_SafeStr_4020[_SafeStr_4780][1]);
                if (_local_1 != null)
                {
                    _local_3 = _local_1.value;
                    setPreviewFromAsset(_local_3);
                };
            };
        }

        private function setElementImage(_arg_1:_SafeStr_3264, _arg_2:BitmapData):void
        {
            if (_arg_2 == null)
            {
                return;
            };
            if (_arg_1 == null)
            {
                return;
            };
            if (_arg_1.disposed)
            {
                return;
            };
            var _local_3:int = int(((_arg_1.width - _arg_2.width) / 2));
            var _local_4:int = int(((_arg_1.height - _arg_2.height) / 2));
            if (_arg_1.bitmap == null)
            {
                _arg_1.bitmap = new BitmapData(_arg_1.width, _arg_1.height, true, 0xFFFFFF);
            };
            _arg_1.bitmap.fillRect(_arg_1.bitmap.rect, 0xFFFFFF);
            _arg_1.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(_local_3, _local_4), null, null, false);
            _arg_1.invalidate();
        }

        private function setPreviewFromAsset(_arg_1:String):void
        {
            if ((((!(_arg_1)) || (!(_roomEvents))) || (!(_roomEvents.assets))))
            {
                return;
            };
            var _local_3:BitmapDataAsset = (_roomEvents.assets.getAssetByName(_arg_1) as BitmapDataAsset);
            if (_local_3 == null)
            {
                retrievePreviewAsset(_arg_1);
                return;
            };
            var _local_2:_SafeStr_3264 = (find(_window, "help_image") as _SafeStr_3264);
            if (_local_2)
            {
                setElementImage(_local_2, (_local_3.content as BitmapData));
            };
        }

        private function retrievePreviewAsset(_arg_1:String):void
        {
            if ((((!(_arg_1)) || (!(_roomEvents))) || (!(_roomEvents.assets))))
            {
                return;
            };
            var _local_4:String = _roomEvents.getProperty("image.library.catalogue.url");
            var _local_5:String = ((_local_4 + _arg_1) + ".gif");
            _SafeStr_14.log(("[ProductViewCatalogWidget] Retrieve Product Preview Asset: " + _local_5));
            var _local_2:URLRequest = new URLRequest(_local_5);
            var _local_3:AssetLoaderStruct = _roomEvents.assets.loadAssetFromFile(_arg_1, _local_2, "image/gif");
            if (!_local_3)
            {
                return;
            };
            _local_3.addEventListener("AssetLoaderEventComplete", onPreviewImageReady);
        }

        private function onPreviewImageReady(_arg_1:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (_arg_1.target as AssetLoaderStruct);
            if (_local_2 != null)
            {
                setPreviewFromAsset(_local_2.assetName);
            };
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.help

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4020 = "_-el" (String#1659, DoABC#4)
// _SafeStr_4780 = "_-fK" (String#917, DoABC#4)
// _SafeStr_6432 = "_-N" (String#14527, DoABC#4)
// _SafeStr_6433 = "_-bQ" (String#10829, DoABC#4)


