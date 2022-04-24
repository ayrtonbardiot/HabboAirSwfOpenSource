// by nota

//com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout

package com.sulake.habbo.friendbar.landingview.layout
{
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;
    import _-g1x._SafeStr_549;
    import _-hV._SafeStr_947;
    import com.sulake.core.window._SafeStr_3109;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISlotAwareWidget;

    public class WidgetContainerLayout implements _SafeStr_41 
    {

        private static const WIDGET_COLORABLE_TEXTELEMENT_TAG:String = "COLORABLE";
        private static const _SafeStr_8555:int = 0;
        private static const DEFAULT_LAYOUT:String = "landing_view_default_dynamic_layout";
        private static const GENERIC_RECEPTION_LAYOUT:String = "landing_view_generic_reception";
        private static const WIDGET_PLACEHOLDER_PREFIX:String = "widget_placeholder_";
        private static const _SafeStr_6299:Array = ["background_back", "background_front", "background_gradient_top", "background_hotel_top", "background_gradient", "background_right", "background_horizon", "background_left", "background_left_bottom"];

        protected var _landingView:HabboLandingView;
        protected var _window:_SafeStr_3133;
        protected var _dynamicWidgetLayout:DynamicLayoutManager;
        protected var _SafeStr_6295:MovingBackgroundObjects;
        protected var _orgWindowWidth:int;
        protected var _SafeStr_6298:int;
        private var _SafeStr_4346:Array = [];
        private var _SafeStr_6296:CommonWidgetSettings;
        private var _SafeStr_6297:String;

        public function WidgetContainerLayout(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
            registerFixedWidgets();
            _SafeStr_6295 = new MovingBackgroundObjects(_landingView);
            _SafeStr_6296 = new CommonWidgetSettings(_landingView);
            _arg_1.registerUpdateReceiver(this, 1000);
        }

        private static function getColorizableElements(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = new Array(0);
            _arg_1.groupChildrenWithTag("COLORABLE", _local_2, -1);
            return (_local_2);
        }

        public static function applyColorizableWidgetTextColor(_arg_1:_SafeStr_3133, _arg_2:uint):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            for each (var _local_3:ITextWindow in getColorizableElements(_arg_1))
            {
                _local_3.textColor = _arg_2;
            };
        }

        public static function applyColorizableWidgetEtchingColor(_arg_1:_SafeStr_3133, _arg_2:uint):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            for each (var _local_3:ITextWindow in getColorizableElements(_arg_1))
            {
                _local_3.etchingColor = _arg_2;
            };
        }

        public static function applyColorizableWidgetEtchingPosition(_arg_1:_SafeStr_3133, _arg_2:String):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            for each (var _local_3:ITextWindow in getColorizableElements(_arg_1))
            {
                _local_3.etchingPosition = _arg_2;
            };
        }

        public static function applyCommonWidgetSettings(_arg_1:_SafeStr_3133, _arg_2:CommonWidgetSettings):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            if ((((_arg_2.isTextColorSet) || (_arg_2.isEtchingColorSet)) || (_arg_2.isEtchingPositionSet)))
            {
                for each (var _local_3:ITextWindow in getColorizableElements(_arg_1))
                {
                    _local_3.textColor = ((_arg_2.isTextColorSet) ? _arg_2.textColor : _local_3.textColor);
                    _local_3.etchingColor = ((_arg_2.isEtchingColorSet) ? _arg_2.etchingColor : _local_3.etchingColor);
                    _local_3.etchingPosition = ((_arg_2.isEtchingPositionSet) ? _arg_2.etchingPosition : _local_3.etchingPosition);
                };
            };
        }


        public function update(_arg_1:uint):void
        {
            if (((!(_window == null)) && (_window.visible)))
            {
                _SafeStr_6295.update(_arg_1);
            };
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        public function dispose():void
        {
            if (_landingView)
            {
                _landingView.removeUpdateReceiver(this);
            };
            _landingView = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_4346)
            {
                for each (var _local_1:WidgetContainer in _SafeStr_4346)
                {
                    _local_1.dispose();
                };
                _SafeStr_4346 = null;
            };
            if (_SafeStr_6295)
            {
                _SafeStr_6295.dispose();
                _SafeStr_6295 = null;
            };
            if (_dynamicWidgetLayout)
            {
                _dynamicWidgetLayout.dispose();
                _dynamicWidgetLayout = null;
            };
            if (_SafeStr_6296)
            {
                _SafeStr_6296 = null;
            };
        }

        public function activate():void
        {
            if (_window == null)
            {
                createWindow();
                registerDynamicWidgets();
                _landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_549(onTimingCode));
                _SafeStr_6297 = _landingView.getProperty("landing.view.bgtiming");
            };
            for each (var _local_1:WidgetContainer in _SafeStr_4346)
            {
                _local_1.refresh(_window);
            };
            resizeWindow();
            _landingView.windowManager.getWindowContext(0).getDesktopWindow().addEventListener("WE_RESIZED", onDesktopResized);
            _window.invalidate();
            if (navigatorPosition != null)
            {
                _landingView.navigator.openNavigator(navigatorPosition);
            };
            _landingView.send(new _SafeStr_947(_SafeStr_6297));
            _window.visible = true;
        }

        private function get navigatorPosition():Point
        {
            var _local_2:* = null;
            var _local_1:_SafeStr_3109 = _window.findChildByName("navigator_placer");
            if (_local_1 == null)
            {
                return (null);
            };
            _local_2 = new Point();
            _local_1.getGlobalPosition(_local_2);
            return (_local_2);
        }

        public function disable():void
        {
            if (_window != null)
            {
                _window.visible = false;
            };
            for each (var _local_1:WidgetContainer in _SafeStr_4346)
            {
                _local_1.disable();
            };
        }

        protected function createWindow():void
        {
            if (_window != null)
            {
                return;
            };
            var _local_1:String = getLayout();
            _window = _SafeStr_3133(_landingView.getXmlWindow(_local_1, 0));
            hideWarningIfPresent();
            if (_landingView.getBoolean("landing.view.right_pane_dimmer.hidden"))
            {
                if (_window.findChildByName("right_pane_dimmer") != null)
                {
                    _window.findChildByName("right_pane_dimmer").visible = false;
                };
            };
            setOrgWindowSize();
            setupBottomSlotWidgetName();
        }

        private function hideWarningIfPresent():void
        {
            var _local_1:_SafeStr_3109 = _window.findChildByName("warning");
            if (_local_1 != null)
            {
                _local_1.visible = false;
            };
        }

        protected function setOrgWindowSize():void
        {
            _orgWindowWidth = _window.width;
            _SafeStr_6298 = _window.height;
        }

        protected function setupBottomSlotWidgetName():void
        {
            var _local_1:* = null;
            var _local_2:_SafeStr_3109 = _window.findChildByName("widget_placeholder_bottom_slot");
            if (_local_2 != null)
            {
                _local_1 = _landingView.getProperty("landing.view.dynamic.slot.6.widget");
                if (_local_1 == "")
                {
                    _local_2.visible = false;
                }
                else
                {
                    _local_2.name = ("widget_placeholder_" + _local_1);
                };
            };
        }

        private function getLayout():String
        {
            return ((_landingView.propertyExists("landing.view.layoutxml")) ? _landingView.getProperty("landing.view.layoutxml") : "landing_view_default_dynamic_layout");
        }

        private function isGenericReceptionLayout():Boolean
        {
            return (getLayout() == "landing_view_generic_reception");
        }

        protected function resizeWindow():void
        {
            if (_window != null)
            {
                if (_dynamicWidgetLayout != null)
                {
                    resizeDynamicLayout();
                }
                else
                {
                    resizeCustomLayout();
                };
                _window.invalidate();
            };
            for each (var _local_1:WidgetContainer in _SafeStr_4346)
            {
                _local_1.windowResized();
            };
        }

        private function resizeDynamicLayout():void
        {
            var _local_1:Rectangle = _window.desktop.rectangle;
            _window.width = _local_1.width;
            _window.height = _local_1.height;
            var _local_2:int = (_SafeStr_6298 - _local_1.height);
            var _local_3:int = (_orgWindowWidth - _local_1.width);
            _dynamicWidgetLayout.resizeTo((_dynamicWidgetLayout.topItemListInitialWidth - _local_3), (_dynamicWidgetLayout.topItemListInitialHeight - _local_2));
            _dynamicWidgetLayout.scrollbarRightEdgeRelativeToScreen = Math.min(_window.width, (_local_1.width + window.x));
        }

        private function resizeCustomLayout():void
        {
            _window.x = 0;
            _window.y = 0;
            var _local_1:Rectangle = _window.desktop.rectangle;
            _window.x = Math.max(0, ((_local_1.width - _window.width) / 2));
            if (((_local_1.height > _window.height) || (isGenericReceptionLayout())))
            {
                _window.y = Math.max(0, ((_local_1.height - _window.height) / 2));
            }
            else
            {
                _window.y = (_local_1.height - _window.height);
            };
        }

        protected function onDesktopResized(_arg_1:_SafeStr_3116):void
        {
            resizeWindow();
        }

        private function setBackgroundGraphics(_arg_1:String):void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            _arg_1 = (((_arg_1 == null) || (_arg_1 == "")) ? "" : (_arg_1 + "."));
            for each (var _local_3:String in _SafeStr_6299)
            {
                _local_4 = IStaticBitmapWrapperWindow(_window.findChildByName(_local_3));
                if (_local_4)
                {
                    if (_landingView.getProperty(((("landing.view." + _arg_1) + _local_3) + ".visible")) == "false")
                    {
                        _local_4.visible = false;
                    }
                    else
                    {
                        _local_4.visible = true;
                        _local_2 = _landingView.getProperty(((("landing.view." + _arg_1) + _local_3) + ".uri"), null);
                        if ((((!(_local_4.assetUri == _local_2)) && (!(_local_2 == null))) && (!(_local_2 == ""))))
                        {
                            _local_4.assetUri = _local_2;
                        };
                    };
                };
            };
        }

        private function registerFixedWidgets():void
        {
            registerPlaceholderAnchoredWidget("avatarimage");
            registerPlaceholderAnchoredWidget("expiringcatalogpage");
            registerPlaceholderAnchoredWidget("expiringcatalogpagesmall");
            registerPlaceholderAnchoredWidget("communitygoal");
            registerPlaceholderAnchoredWidget("catalogpromo");
            registerPlaceholderAnchoredWidget("achievementcompetition_hall_of_fame");
            registerPlaceholderAnchoredWidget("achievementcompetition_prizes");
            registerPlaceholderAnchoredWidget("dailyquest");
            registerPlaceholderAnchoredWidget("nextlimitedrarecountdown");
            registerPlaceholderAnchoredWidget("habbomoderationpromo");
            registerPlaceholderAnchoredWidget("habbotalentspromo");
            registerPlaceholderAnchoredWidget("habbowaypromo");
            registerPlaceholderAnchoredWidget("safetyquizpromo");
            registerPlaceholderAnchoredWidget("generic");
            registerPlaceholderAnchoredWidget("widgetcontainer");
        }

        private function registerPlaceholderAnchoredWidget(_arg_1:String):void
        {
            var _local_2:ILandingViewWidget = LandingViewWidgetType.getWidgetForType(_arg_1, _landingView);
            _SafeStr_4346.push(new WidgetContainer(_local_2, ("widget_placeholder_" + _arg_1), _SafeStr_6296));
        }

        private function registerDynamicWidgets():void
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_1:* = null;
            if (_window.findChildByName("placeholder_dynamic_widget_slots") == null)
            {
                _SafeStr_14.log("ERROR! Tried to initialize dynamic widget list for landing view without the dynamic element present");
                return;
            };
            _dynamicWidgetLayout = new DynamicLayoutManager(this, _SafeStr_6296);
            _local_3 = 0;
            while (_local_3 < 6)
            {
                _local_2 = _landingView.getProperty((("landing.view.dynamic.slot." + (_local_3 + 1)) + ".widget"), null);
                _local_1 = LandingViewWidgetType.getWidgetForType(_local_2, _landingView);
                if (_local_1 != null)
                {
                    if ((_local_1 is ISlotAwareWidget))
                    {
                        ISlotAwareWidget(_local_1).slot = (_local_3 + 1);
                    };
                    _SafeStr_4346.push(new WidgetContainer(_local_1, null, _SafeStr_6296, _dynamicWidgetLayout.getDynamicSlotContainer(_local_3)));
                };
                _local_3++;
            };
            if (_landingView.getBoolean("landing.view.dynamic.slot.5.ignore"))
            {
                _dynamicWidgetLayout.ignoreBottomRightSlot = true;
            };
            if (_landingView.getBoolean("landing.view.dynamic.slot.4.separator"))
            {
                _dynamicWidgetLayout.enableSeparator(4, _landingView.getProperty("landing.view.dynamic.slot.4.title"));
            };
            if (_landingView.getBoolean("landing.view.dynamic.slot.5.separator"))
            {
                _dynamicWidgetLayout.enableSeparator(5, _landingView.getProperty("landing.view.dynamic.slot.5.title"));
            };
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function get landingView():HabboLandingView
        {
            return (_landingView);
        }

        private function onTimingCode(_arg_1:_SafeStr_549):void
        {
            if (((_arg_1.getParser().schedulingStr == _SafeStr_6297) && (_landingView)))
            {
                setBackgroundGraphics(_arg_1.getParser().code);
                _SafeStr_6295.timingCode = _arg_1.getParser().code;
                _SafeStr_6295.initialize(_window);
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.layout

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4346 = "_-11n" (String#1019, DoABC#4)
// _SafeStr_549 = "_-Y1W" (String#8530, DoABC#4)
// _SafeStr_6295 = "_-a10" (String#7593, DoABC#4)
// _SafeStr_6296 = "_-42" (String#2661, DoABC#4)
// _SafeStr_6297 = "_-84" (String#4997, DoABC#4)
// _SafeStr_6298 = "_-J1O" (String#22240, DoABC#4)
// _SafeStr_6299 = "_-Yw" (String#19294, DoABC#4)
// _SafeStr_8555 = "_-W1U" (String#25037, DoABC#4)
// _SafeStr_947 = "_-iy" (String#12865, DoABC#4)


