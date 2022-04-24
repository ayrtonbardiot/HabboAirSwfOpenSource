// by nota

//com.sulake.habbo.friendbar.view.tabs.tokens.Token

package com.sulake.habbo.friendbar.view.tabs.tokens
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.geom.Rectangle;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.game._SafeStr_1699;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.friendbar.data.IFriendNotification;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.motion._SafeStr_3336;
    import com.sulake.core.window.motion.DropBounce;

    public class Token implements _SafeStr_13 
    {

        protected static const TITLE:String = "title";
        protected static const MESSAGE:String = "message";
        protected static const ICON_RECTANGLE:Rectangle = new Rectangle(0, 0, 25, 25);

        protected static var _WINDOW_MANAGER:_SafeStr_1695;
        protected static var _SafeStr_5967:IAssetLibrary;
        protected static var _GAMES:_SafeStr_1699;

        protected var _icon:IRegionWindow;
        protected var _window:_SafeStr_3133;
        protected var _disposed:Boolean;
        protected var _notification:IFriendNotification;

        public function Token(_arg_1:IFriendNotification)
        {
            _notification = _arg_1;
        }

        public static function set WINDOWING(_arg_1:_SafeStr_1695):void
        {
            _WINDOW_MANAGER = _arg_1;
        }

        public static function set ASSETS(_arg_1:IAssetLibrary):void
        {
            _SafeStr_5967 = _arg_1;
        }

        public static function set GAMES(_arg_1:_SafeStr_1699):void
        {
            _GAMES = _arg_1;
        }


        public function get typeCode():int
        {
            return (_notification.typeCode);
        }

        public function get viewOnce():Boolean
        {
            return (_notification.viewOnce);
        }

        public function get notification():IFriendNotification
        {
            return (_notification);
        }

        public function get iconElement():_SafeStr_3109
        {
            return (_icon);
        }

        public function get windowElement():_SafeStr_3109
        {
            return (_window);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_icon)
            {
                _icon.dispose();
                _icon = null;
            };
            _notification = null;
            _disposed = true;
        }

        protected function prepare(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String):void
        {
            _window = (_WINDOW_MANAGER.buildFromXML((_SafeStr_5967.getAssetByName(_arg_3).content as XML)) as _SafeStr_3133);
            _window.findChildByName("title").caption = _arg_1;
            _window.findChildByName("message").caption = ((_arg_2) ? _arg_2 : "");
            _icon = (_WINDOW_MANAGER.create(("ICON_" + typeCode), 5, 0, 1, Token.ICON_RECTANGLE) as IRegionWindow);
            _icon.mouseThreshold = 0;
            var _local_5:IStaticBitmapWrapperWindow = (_WINDOW_MANAGER.create(("BITMAP_" + typeCode), 23, 0, 0, Token.ICON_RECTANGLE) as IStaticBitmapWrapperWindow);
            _local_5.assetUri = _arg_4;
            _icon.addChild(_local_5);
            if (_SafeStr_3336.getMotionByTarget(_icon) == null)
            {
                _SafeStr_3336.runMotion(new DropBounce(_icon, 600, 32));
            };
        }


    }
}//package com.sulake.habbo.friendbar.view.tabs.tokens

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1699 = "_-uf" (String#3285, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3336 = "_-TU" (String#3431, DoABC#4)
// _SafeStr_5967 = "_-N11" (String#21346, DoABC#4)


