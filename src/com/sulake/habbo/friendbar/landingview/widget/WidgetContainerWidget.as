// by nota

//com.sulake.habbo.friendbar.landingview.widget.WidgetContainerWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISlotAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Dictionary;
    import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
    import com.sulake.habbo.friendbar.landingview.layout.WidgetContainer;
    import com.sulake.core.window._SafeStr_3109;
    import _-g1x._SafeStr_549;
    import _-hV._SafeStr_947;
    import com.sulake.habbo.friendbar.landingview.layout.LandingViewWidgetType;
    import com.sulake.habbo.friendbar.landingview.interfaces._SafeStr_3482;
    import com.sulake.habbo.friendbar.landingview.*;

    public class WidgetContainerWidget implements ILandingViewWidget, ISlotAwareWidget 
    {

        private var _landingView:HabboLandingView;
        private var _container:_SafeStr_3133;
        private var _SafeStr_4346:Dictionary = new Dictionary();
        private var _SafeStr_6296:CommonWidgetSettings;
        private var _SafeStr_6938:int;
        private var _SafeStr_6297:String;
        private var _SafeStr_6947:WidgetContainer;

        public function WidgetContainerWidget(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
        }

        public static function hideChildren(_arg_1:_SafeStr_3133):void
        {
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < _arg_1.numChildren)
            {
                _arg_1.getChildAt(_local_2).visible = false;
                _local_2++;
            };
        }


        public function set slot(_arg_1:int):void
        {
            _SafeStr_6938 = _arg_1;
        }

        public function get container():_SafeStr_3109
        {
            return (_container);
        }

        public function dispose():void
        {
            _landingView = null;
            _container = null;
        }

        public function initialize():void
        {
            _container = _SafeStr_3133(_landingView.getXmlWindow("widget_container_widget"));
            _SafeStr_6296 = new CommonWidgetSettings(_landingView);
            _landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_549(onTimingCode));
            _SafeStr_6297 = _landingView.getProperty((("landing.view.dynamic.slot." + _SafeStr_6938) + ".conf"));
        }

        public function refresh():void
        {
            _landingView.send(new _SafeStr_947(_SafeStr_6297));
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        private function refreshContent():void
        {
            hideChildren(_container);
            if (_SafeStr_6947 != null)
            {
                _SafeStr_6947.refresh(_container);
                _SafeStr_6947.container.visible = true;
                _container.height = _SafeStr_6947.container.height;
                _container.width = _SafeStr_6947.container.width;
            };
        }

        private function createWidgetContainer(_arg_1:String):WidgetContainer
        {
            var _local_3:String = _landingView.getProperty((("landing.view." + _arg_1) + ".widget"));
            var _local_2:ILandingViewWidget = LandingViewWidgetType.getWidgetForType(_local_3, _landingView);
            if (_local_2 == null)
            {
                return (null);
            };
            if ((_local_2 is ISlotAwareWidget))
            {
                ISlotAwareWidget(_local_2).slot = _SafeStr_6938;
            };
            if ((_local_2 is _SafeStr_3482))
            {
                _SafeStr_3482(_local_2).configurationCode = _arg_1;
            };
            var _local_4:WidgetContainer = new WidgetContainer(_local_2, null, _SafeStr_6296, _container);
            _SafeStr_4346[_arg_1] = _local_4;
            return (_local_4);
        }

        private function onTimingCode(_arg_1:_SafeStr_549):void
        {
            if (((_arg_1.getParser().schedulingStr == _SafeStr_6297) && (!(disposed))))
            {
                switchCurrentWidget(_arg_1.getParser().code);
                refreshContent();
            };
        }

        private function switchCurrentWidget(_arg_1:String):void
        {
            if (_arg_1 == "")
            {
                _SafeStr_6947 = null;
                return;
            };
            var _local_2:WidgetContainer = _SafeStr_4346[_arg_1];
            if (_local_2 == null)
            {
                _local_2 = createWidgetContainer(_arg_1);
            };
            _SafeStr_6947 = _local_2;
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3482 = "_-n1q" (String#10435, DoABC#4)
// _SafeStr_4346 = "_-11n" (String#1019, DoABC#4)
// _SafeStr_549 = "_-Y1W" (String#8530, DoABC#4)
// _SafeStr_6296 = "_-42" (String#2661, DoABC#4)
// _SafeStr_6297 = "_-84" (String#4997, DoABC#4)
// _SafeStr_6938 = "_-b9" (String#4844, DoABC#4)
// _SafeStr_6947 = "_-7" (String#7319, DoABC#4)
// _SafeStr_947 = "_-iy" (String#12865, DoABC#4)


