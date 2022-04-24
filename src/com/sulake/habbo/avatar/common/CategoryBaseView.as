// by nota

//com.sulake.habbo.avatar.common.CategoryBaseView

package com.sulake.habbo.avatar.common
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class CategoryBaseView 
    {

        protected var _window:_SafeStr_3133;
        protected var _SafeStr_3887:String = "";
        protected var _currentTabName:String = "";
        protected var _SafeStr_4619:_SafeStr_3301;
        protected var _SafeStr_3883:Boolean;

        public function CategoryBaseView(_arg_1:_SafeStr_3301)
        {
            _SafeStr_4619 = _arg_1;
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4619 = null;
            _SafeStr_3883 = false;
        }

        public function init():void
        {
        }

        public function reset():void
        {
            _SafeStr_3887 = "";
            _currentTabName = "";
            _SafeStr_3883 = false;
        }

        public function getWindowContainer():_SafeStr_3133
        {
            if (!_SafeStr_3883)
            {
                init();
            };
            return (_window);
        }

        public function showPalettes(_arg_1:String, _arg_2:int):void
        {
            _SafeStr_4619.controller.view.gridView.showPalettes(_arg_2);
        }

        protected function updateGridView(_arg_1:String):void
        {
            _SafeStr_4619.controller.view.gridView.initFromList(_SafeStr_4619, _arg_1);
        }

        protected function activateTab(_arg_1:String):void
        {
            var _local_2:* = null;
            if (!_window)
            {
                return;
            };
            var _local_3:_SafeStr_3133 = (_window.findChildByName(_arg_1) as _SafeStr_3133);
            if (_local_3)
            {
                _local_2 = (_local_3.findChildByTag("BITMAP") as IStaticBitmapWrapperWindow);
                TabUtils.setElementImage(_local_2, true);
            };
        }

        protected function inactivateTab(_arg_1:String):void
        {
            var _local_2:* = null;
            if (!_window)
            {
                return;
            };
            var _local_3:_SafeStr_3133 = (_window.findChildByName(_arg_1) as _SafeStr_3133);
            if (_local_3)
            {
                _local_2 = (_local_3.findChildByTag("BITMAP") as IStaticBitmapWrapperWindow);
                TabUtils.setElementImage(_local_2, false);
            };
        }


    }
}//package com.sulake.habbo.avatar.common

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_3887 = "_-6N" (String#2449, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)


