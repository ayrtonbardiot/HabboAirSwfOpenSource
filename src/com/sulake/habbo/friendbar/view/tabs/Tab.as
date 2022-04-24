// by nota

//com.sulake.habbo.friendbar.view.tabs.Tab

package com.sulake.habbo.friendbar.view.tabs
{
    import com.sulake.habbo.friendbar.data._SafeStr_3134;
    import com.sulake.habbo.friendlist._SafeStr_1874;
    import com.sulake.habbo.game._SafeStr_1699;
    import com.sulake.habbo.friendbar.view._SafeStr_3185;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.friendbar.view.utils.TextCropper;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.geom.Point;

    public class Tab implements ITab 
    {

        protected static const _SafeStr_8580:Boolean = false;
        protected static const _MOTION_TIME:int = 80;
        protected static const _SafeStr_8581:int = 3;

        public static var WIDTH:int = 127;
        public static var HEIGHT:int = 36;
        public static var DATA:_SafeStr_3134;
        public static var FRIENDS:_SafeStr_1874;
        public static var GAMES:_SafeStr_1699;
        public static var VIEW:_SafeStr_3185;
        public static var ASSETS:IAssetLibrary;
        public static var WINDOWING:_SafeStr_1695;
        public static var _SafeStr_5174:_SafeStr_18;
        public static var TRACKING:_SafeStr_1704;
        public static var CROPPER:TextCropper;

        protected var _window:_SafeStr_3133;
        protected var _SafeStr_4031:Boolean;
        private var _SafeStr_5719:Boolean;
        private var _selected:Boolean;
        private var _disposed:Boolean;


        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function get selected():Boolean
        {
            return (_selected);
        }

        public function get recycled():Boolean
        {
            return (_SafeStr_4031);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        protected function get exposed():Boolean
        {
            return (_SafeStr_5719);
        }

        public function select(_arg_1:Boolean):void
        {
            conceal();
            _selected = true;
        }

        public function deselect(_arg_1:Boolean):void
        {
            _selected = false;
        }

        public function recycle():void
        {
            conceal();
            _SafeStr_4031 = true;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_window)
                {
                    _window.dispose();
                    _window = null;
                };
                _disposed = true;
            };
        }

        protected function expose():void
        {
            _SafeStr_5719 = true;
        }

        protected function conceal():void
        {
            _SafeStr_5719 = false;
        }

        protected function onMouseClick(_arg_1:WindowMouseEvent):void
        {
            if (((disposed) || (recycled)))
            {
                return;
            };
            if (selected)
            {
                VIEW.deSelect(true);
            }
            else
            {
                VIEW.selectTab(this, true);
            };
        }

        protected function onMouseOver(_arg_1:WindowMouseEvent):void
        {
            if (((disposed) || (recycled)))
            {
                return;
            };
            if (!selected)
            {
                expose();
            };
        }

        protected function onMouseOut(_arg_1:WindowMouseEvent):void
        {
            if ((((disposed) || (recycled)) || (_window == null)))
            {
                return;
            };
            if (!selected)
            {
                if (!_window.hitTestGlobalPoint(new Point(_arg_1.stageX, _arg_1.stageY)))
                {
                    conceal();
                };
            };
        }


    }
}//package com.sulake.habbo.friendbar.view.tabs

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1699 = "_-uf" (String#3285, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3134 = "_-Jw" (String#11081, DoABC#4)
// _SafeStr_3185 = "_-jn" (String#5721, DoABC#4)
// _SafeStr_4031 = "_-q7" (String#1788, DoABC#4)
// _SafeStr_5174 = "_-qZ" (String#4380, DoABC#4)
// _SafeStr_5719 = "_-sK" (String#12219, DoABC#4)
// _SafeStr_8580 = "_-B1x" (String#32108, DoABC#4)
// _SafeStr_8581 = "_-Ml" (String#39329, DoABC#4)


