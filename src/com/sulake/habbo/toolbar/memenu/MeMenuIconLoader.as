// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.toolbar.memenu.MeMenuIconLoader

package com.sulake.habbo.toolbar.memenu
{
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import flash.display.BitmapData;
    import _-yL._SafeStr_528;
    import _-Ol._SafeStr_327;
    import flash.geom.Point;

    public class MeMenuIconLoader implements _SafeStr_1875 
    {

        private static const MAX_ICON_HEIGHT:int = 50;
        private static const HEAD_MARGIN:int = 3;

        private var _toolbar:HabboToolbar;
        private var _SafeStr_6792:String;
        private var _SafeStr_6793:BitmapData;
        private var _SafeStr_6794:BitmapData;
        private var _SafeStr_6790:_SafeStr_528;
        private var _SafeStr_6927:_SafeStr_327;

        public function MeMenuIconLoader(_arg_1:HabboToolbar)
        {
            _toolbar = _arg_1;
            _SafeStr_6790 = new _SafeStr_528(onUserObject);
            _SafeStr_6927 = new _SafeStr_327(onUserChange);
            _toolbar.communicationManager.addHabboConnectionMessageEvent(_SafeStr_6790);
            _toolbar.communicationManager.addHabboConnectionMessageEvent(_SafeStr_6927);
            setMeMenuToolbarIcon();
        }

        private function setMeMenuToolbarIcon(_arg_1:String=null):void
        {
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_4:* = null;
            var _local_8:* = null;
            var _local_6:* = null;
            var _local_9:* = null;
            var _local_2:* = null;
            if (_toolbar.avatarRenderManager != null)
            {
                _local_7 = ((_arg_1 == null) ? _toolbar.sessionDataManager.figure : _arg_1);
                if (_local_7 != _SafeStr_6792)
                {
                    _local_4 = _toolbar.sessionDataManager.gender;
                    _local_8 = _toolbar.avatarRenderManager.createAvatarImage(_local_7, "h", _local_4, this);
                    if (_local_8 != null)
                    {
                        _local_8.setDirection("full", 2);
                        _local_3 = _local_8.getCroppedImage("full");
                        _local_5 = _local_8.getCroppedImage("head");
                        _local_8.dispose();
                    };
                    _SafeStr_6792 = _local_7;
                    if (_SafeStr_6793 != null)
                    {
                        _SafeStr_6793.dispose();
                    };
                    _SafeStr_6793 = _local_3;
                    if (_SafeStr_6794 != null)
                    {
                        _SafeStr_6794.dispose();
                    };
                    _SafeStr_6794 = _local_5;
                }
                else
                {
                    _local_3 = _SafeStr_6793;
                    _local_5 = _SafeStr_6794;
                };
            };
            if (_toolbar != null)
            {
                if (((!(_local_3 == null)) && (!(_local_5 == null))))
                {
                    if (_local_3.height > 50)
                    {
                        _local_9 = new BitmapData(_local_3.width, 50, true, 0);
                        _local_2 = _local_9.rect.clone();
                        if (_local_5.height > (50 - 3))
                        {
                            _local_2.offset(0, ((_local_5.height - 50) + 3));
                        };
                        _local_9.copyPixels(_local_3, _local_2, new Point(0, 0));
                        _local_6 = _local_9;
                    }
                    else
                    {
                        _local_6 = _local_3.clone();
                    };
                };
                _toolbar.setIconBitmap("HTIE_ICON_MEMENU", _local_6);
            };
        }

        public function avatarImageReady(_arg_1:String):void
        {
            _SafeStr_6792 = "";
            setMeMenuToolbarIcon();
        }

        private function onUserObject(_arg_1:_SafeStr_528):void
        {
            setMeMenuToolbarIcon(_arg_1.getParser().figure);
        }

        private function onUserChange(_arg_1:_SafeStr_327):void
        {
            if (_arg_1.id == -1)
            {
                setMeMenuToolbarIcon(_arg_1.figure);
            };
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_6790 != null)
            {
                _toolbar.communicationManager.removeHabboConnectionMessageEvent(_SafeStr_6790);
                _SafeStr_6790 = null;
            };
            if (_SafeStr_6927 != null)
            {
                _toolbar.communicationManager.removeHabboConnectionMessageEvent(_SafeStr_6927);
                _SafeStr_6927 = null;
            };
            _toolbar = null;
        }

        public function get disposed():Boolean
        {
            return (_toolbar == null);
        }


    }
}//package com.sulake.habbo.toolbar.memenu

// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_327 = "_-Uf" (String#3336, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)
// _SafeStr_6790 = "_-QC" (String#3295, DoABC#4)
// _SafeStr_6792 = "_-j8" (String#6369, DoABC#4)
// _SafeStr_6793 = "_-BZ" (String#6012, DoABC#4)
// _SafeStr_6794 = "_-hP" (String#6069, DoABC#4)
// _SafeStr_6927 = "_-K1g" (String#4761, DoABC#4)


