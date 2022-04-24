// by nota

//com.sulake.habbo.ui.widget.loadingbar.LoadingBarWidget

package com.sulake.habbo.ui.widget.loadingbar
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.runtime._SafeStr_19;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetLoadingBarUpdateEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components._SafeStr_3189;
    import com.sulake.habbo.utils.HabboWebTools;
    import flash.events.Event;

    public class LoadingBarWidget extends RoomWidgetBase 
    {

        private var _window:_SafeStr_3195;
        private var _config:_SafeStr_19;
        private var _SafeStr_4204:BitmapData;
        private var _SafeStr_4177:String = "";
        private var _SafeStr_4203:Sprite = null;

        public function LoadingBarWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18, _arg_5:_SafeStr_19)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _config = _arg_5;
        }

        override public function dispose():void
        {
            if (_SafeStr_4203 != null)
            {
                _SafeStr_4203.removeEventListener("click", clickHandler);
                _SafeStr_4203 = null;
            };
            if (_SafeStr_4204 != null)
            {
                _SafeStr_4204.dispose();
                _SafeStr_4204 = null;
            };
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            _config = null;
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWLBUE_SHOW_LOADING_BAR", onShowLoadingBar);
            _arg_1.addEventListener("RWLBUW_HIDE_LOADING_BAR", onHideLoadingBar);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWLBUE_SHOW_LOADING_BAR", onShowLoadingBar);
            _arg_1.removeEventListener("RWLBUW_HIDE_LOADING_BAR", onShowLoadingBar);
            _arg_1.removeEventListener("RWLBUW_HIDE_LOADING_BAR", onHideLoadingBar);
        }

        private function onShowLoadingBar(_arg_1:RoomWidgetLoadingBarUpdateEvent):void
        {
            if (((_arg_1 == null) || (!(_arg_1.type == "RWLBUE_SHOW_LOADING_BAR"))))
            {
                return;
            };
            if (!createWindow())
            {
                return;
            };
            _window.visible = true;
            _window.center();
        }

        private function onHideLoadingBar(_arg_1:RoomWidgetLoadingBarUpdateEvent):void
        {
            if (((_arg_1 == null) || (!(_arg_1.type == "RWLBUW_HIDE_LOADING_BAR"))))
            {
                return;
            };
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function createWindow():Boolean
        {
            var _local_4:int;
            if (_window != null)
            {
                return (true);
            };
            var _local_2:XmlAsset = (assets.getAssetByName("room_loading_bar") as XmlAsset);
            if (_local_2 == null)
            {
                return (false);
            };
            _window = (windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3195);
            if (_window == null)
            {
                return (false);
            };
            _window.visible = false;
            var _local_3:IRegionWindow = (_window.findChildByName("region") as IRegionWindow);
            if (_local_3 != null)
            {
            };
            var _local_1:_SafeStr_3189 = (_window.findChildByName("image") as _SafeStr_3189);
            if (_local_1 != null)
            {
                _local_4 = _local_1.height;
                _window.scale(0, -(_local_4));
            };
            return (true);
        }

        private function clickHandler(_arg_1:Event):void
        {
            if (_SafeStr_4177 != "")
            {
                HabboWebTools.openWebPage(_SafeStr_4177);
            };
        }


    }
}//package com.sulake.habbo.ui.widget.loadingbar

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_4177 = "_-G1Y" (String#3681, DoABC#4)
// _SafeStr_4203 = "_-F1Y" (String#13915, DoABC#4)
// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)


