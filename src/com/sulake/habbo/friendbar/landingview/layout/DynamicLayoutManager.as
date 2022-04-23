// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.layout.DynamicLayoutManager

package com.sulake.habbo.friendbar.landingview.layout
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3133;
    import __AS3__.vec.Vector;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import flash.geom.Rectangle;

    public class DynamicLayoutManager implements _SafeStr_13 
    {

        public static const PLACEHOLDER_NAME:String = "placeholder_dynamic_widget_slots";
        public static const CONTENT_AREA_START_X:int = 230;
        private static const NUMBER_OF_SLOTS:int = 5;
        private static const RESIZE_TOLERANCE_SCROLLBAR_VISIBILITY:int = 6;
        private static const ABSOLUTE_MINIMUM_HEIGHT:int = 360;

        private var _layout:WidgetContainerLayout;
        private var _SafeStr_6608:IItemListWindow;
        private var _SafeStr_6606:IItemListWindow;
        private var _SafeStr_6602:IItemListWindow;
        private var _SafeStr_6619:_SafeStr_3133;
        private var _SafeStr_4477:IItemListWindow;
        private var _SafeStr_6604:_SafeStr_3133;
        private var _SafeStr_6420:Vector.<_SafeStr_3133> = new Vector.<_SafeStr_3133>(5);
        private var _SafeStr_6603:IItemListWindow;
        private var _SafeStr_6605:IItemListWindow;
        private var _SafeStr_6618:_SafeStr_3133;
        private var _SafeStr_6607:_SafeStr_3109;
        private var _fromTopScrollbar:IScrollbarWindow;
        private var _window:_SafeStr_3133;
        private var _SafeStr_6611:Boolean = false;
        private var _SafeStr_6296:CommonWidgetSettings;
        private var _SafeStr_6615:int = 10;
        private var _SafeStr_6614:int = 50;
        private var _SafeStr_6617:int = 10;
        private var _SafeStr_6616:int = 80;
        private var _SafeStr_6613:int = 10;
        private var _SafeStr_6612:int = 60;
        private var _SafeStr_6609:int = -1;
        private var _topItemListInitialWidth:int = -1;
        private var _SafeStr_3853:Boolean = false;
        private var _SafeStr_6610:_SafeStr_3109 = null;

        public function DynamicLayoutManager(_arg_1:WidgetContainerLayout, _arg_2:CommonWidgetSettings)
        {
            var _local_5:int;
            super();
            _layout = _arg_1;
            _SafeStr_6296 = _arg_2;
            _window = _SafeStr_3133(_layout.landingView.getXmlWindow("dynamic_widget_grid"));
            var _local_6:_SafeStr_3109 = _layout.window.findChildByName("placeholder_dynamic_widget_slots");
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_local_6.parent);
            _local_3.addChildAt(_window, _local_3.getChildIndex(_local_6));
            _local_3.removeChild(_local_6);
            _SafeStr_6608 = IItemListWindow(_window.findChildByName("widgetlist_fromtop"));
            _SafeStr_6619 = _SafeStr_3133(_window.findChildByName("center_slots_container"));
            _SafeStr_6606 = IItemListWindow(_window.findChildByName("widget_slots_center_scrollable"));
            _SafeStr_6602 = IItemListWindow(_window.findChildByName("widget_slots_center_left"));
            _SafeStr_4477 = IItemListWindow(_window.findChildByName("widget_slots_center_right"));
            _SafeStr_6604 = _SafeStr_3133(_window.findChildByName("widget_slots_right"));
            _SafeStr_6603 = IItemListWindow(_window.findChildByName("widget_slot_4_root"));
            _SafeStr_6605 = IItemListWindow(_window.findChildByName("widget_slot_5_root"));
            _SafeStr_6607 = _layout.landingView.getXmlWindow("dynamic_widget_grid_separator");
            _local_5 = 0;
            while (_local_5 < 6)
            {
                _SafeStr_6420[_local_5] = _SafeStr_3133(_window.findChildByName(("widget_slot_" + (_local_5 + 1))));
                if (_SafeStr_6420[_local_5] != null)
                {
                    _SafeStr_6420[_local_5].addEventListener("WE_RESIZED", contractCenterContainer);
                };
                _local_5++;
            };
            _fromTopScrollbar = IScrollbarWindow(_window.findChildByName("center_container_scrollbar"));
            _SafeStr_6618 = _SafeStr_3133(_window.findChildByName("scroll_extra_space_container"));
            var _local_7:int = _layout.landingView.dynamicLayoutLeftPaneWidth;
            var _local_4:int = _layout.landingView.dynamicLayoutRightPaneWidth;
            _SafeStr_6602.width = _local_7;
            _SafeStr_6602.limits.maxWidth = _local_7;
            _SafeStr_6603.width = _local_7;
            _SafeStr_4477.width = _local_4;
            _SafeStr_6604.width = _local_4;
            _SafeStr_6604.limits.maxWidth = _local_4;
            _SafeStr_6605.width = _local_4;
            _SafeStr_6606.arrangeListItems();
        }

        public function dispose():void
        {
            var _local_1:int;
            if (!disposed)
            {
                _local_1 = 0;
                while (_local_1 < 6)
                {
                    if (_SafeStr_6420[_local_1])
                    {
                        _SafeStr_6420[_local_1].dispose();
                    };
                    _SafeStr_6420[_local_1] = null;
                    _local_1++;
                };
                if (_window)
                {
                    _window.dispose();
                    _window = null;
                };
                _layout = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_layout == null);
        }

        public function getDynamicSlotContainer(_arg_1:int):_SafeStr_3133
        {
            return (_SafeStr_6420[_arg_1]);
        }

        public function enableSeparator(_arg_1:int, _arg_2:String):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            switch (_arg_1)
            {
                case 4:
                    _local_3 = _SafeStr_6603;
                    break;
                case 5:
                    _local_3 = _SafeStr_6605;
                    break;
                default:
                    _local_3 = null;
            };
            if (_local_3)
            {
                if (_local_3.numListItems < 2)
                {
                    _local_3.addListItemAt(_SafeStr_6607.clone(), 0);
                };
                _local_4 = ITextWindow(IItemListWindow(_local_3.getListItemAt(0)).getListItemByName("separator_title"));
                _local_4.caption = (("${" + _arg_2) + "}");
                if (_SafeStr_6296 != null)
                {
                    if (_SafeStr_6296.isTextColorSet)
                    {
                        _local_4.textColor = _SafeStr_6296.textColor;
                    };
                    if (_SafeStr_6296.isEtchingColorSet)
                    {
                        _local_4.etchingColor = _SafeStr_6296.etchingColor;
                    };
                    if (_SafeStr_6296.isEtchingPositionSet)
                    {
                        _local_4.etchingPosition = _SafeStr_6296.etchingPosition;
                    };
                };
            };
        }

        private function isSlotOccupied(_arg_1:int):Boolean
        {
            return (_SafeStr_6420[_arg_1].numChildren > 0);
        }

        public function resizeTo(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_6608.height = Math.min(_arg_2, topItemListInitialHeight);
            _SafeStr_6608.height = Math.max(360, _SafeStr_6608.height);
            _SafeStr_6608.width = Math.min(_arg_1, topItemListInitialWidth);
            applyVerticalSize();
        }

        public function set scrollbarRightEdgeRelativeToScreen(_arg_1:int):void
        {
            var _local_2:int = _layout.window.width;
            _arg_1 = (Math.min(_arg_1, _local_2) - _window.x);
            _fromTopScrollbar.x = (_arg_1 - _fromTopScrollbar.width);
        }

        public function get topItemListInitialHeight():int
        {
            if (_SafeStr_6609 == -1)
            {
                _SafeStr_6609 = _SafeStr_6608.height;
            };
            return (_SafeStr_6609);
        }

        public function get topItemListInitialWidth():int
        {
            if (_topItemListInitialWidth == -1)
            {
                _topItemListInitialWidth = _SafeStr_6608.width;
            };
            return (_topItemListInitialWidth);
        }

        private function applyVerticalSize():void
        {
            var _local_1:int;
            clearEmptySlotsForSpace();
            alignTopWidgetRow();
            alignBottomWidgetRow();
            resetToMaximumSpacing();
            setVerticalSpacing((topItemListContentHeight - _SafeStr_6608.height));
            contractCenterContainer();
            adjustScrollbarVisibility();
            setHorizontalSpacing();
            if (!_SafeStr_3853)
            {
                _local_1 = 0;
                while (_local_1 < 6)
                {
                    if (_SafeStr_6420[_local_1] != null)
                    {
                        _SafeStr_6420[_local_1].addEventListener("WE_RESIZED", updateLayout);
                    };
                    _local_1++;
                };
            };
            _SafeStr_3853 = true;
            _SafeStr_6610 = null;
        }

        private function updateLayout(_arg_1:_SafeStr_3116=null):void
        {
            if (_SafeStr_6610 == null)
            {
                _SafeStr_6610 = _arg_1.window;
                applyVerticalSize();
            };
        }

        private function clearEmptySlotsForSpace():void
        {
            var _local_1:int;
            if (!isSlotOccupied(0))
            {
                _SafeStr_6420[0].height = 0;
            };
            _local_1 = 1;
            while (_local_1 <= 4)
            {
                if (!isSlotOccupied(_local_1))
                {
                    _SafeStr_6420[_local_1].height = 1;
                };
                _local_1++;
            };
        }

        private function alignBottomWidgetRow():void
        {
            var _local_1:int;
            if (((isSlotOccupied(3)) || (isSlotOccupied(4))))
            {
                _local_1 = Math.max(_SafeStr_6420[3].height, _SafeStr_6420[4].height);
                _SafeStr_6420[3].height = _local_1;
                _SafeStr_6420[4].height = _local_1;
                if (isSlotOccupied(3))
                {
                    _SafeStr_6420[3].getChildAt(0).y = 0;
                    _SafeStr_6420[3].width = _layout.landingView.dynamicLayoutLeftPaneWidth;
                };
                if (isSlotOccupied(4))
                {
                    _SafeStr_6420[4].getChildAt(0).y = 0;
                    _SafeStr_6420[4].width = _layout.landingView.dynamicLayoutRightPaneWidth;
                };
            };
        }

        private function alignTopWidgetRow():int
        {
            var _local_1:int;
            if (((isSlotOccupied(1)) || (isSlotOccupied(2))))
            {
                if (!_SafeStr_6611)
                {
                    _local_1 = Math.max(_SafeStr_6420[1].height, _SafeStr_6420[2].height);
                    _SafeStr_6420[1].height = _local_1;
                    _SafeStr_6420[2].height = _local_1;
                };
                if (isSlotOccupied(1))
                {
                    _SafeStr_6420[1].getChildAt(0).y = 0;
                    _SafeStr_6420[1].width = _layout.landingView.dynamicLayoutLeftPaneWidth;
                };
                if (isSlotOccupied(2))
                {
                    _SafeStr_6420[2].getChildAt(0).y = 0;
                    _SafeStr_6420[2].width = _layout.landingView.dynamicLayoutRightPaneWidth;
                };
            };
            return (_local_1);
        }

        private function setHorizontalSpacing():void
        {
            var _local_1:int = (_topItemListInitialWidth - _SafeStr_6608.width);
            if (_local_1 > (_SafeStr_6612 - _SafeStr_6613))
            {
                _SafeStr_6606.spacing = _SafeStr_6613;
            }
            else
            {
                _SafeStr_6606.spacing = Math.min(_SafeStr_6612, (_SafeStr_6612 - _local_1));
            };
        }

        private function setVerticalSpacing(_arg_1:int):void
        {
            var _local_2:int = (_SafeStr_6614 - _SafeStr_6615);
            var _local_3:int = (_SafeStr_6616 - _SafeStr_6617);
            _arg_1 = (_arg_1 + (_SafeStr_6615 + _SafeStr_6617));
            if (_arg_1 <= 0)
            {
                _SafeStr_6608.spacing = _SafeStr_6617;
                _SafeStr_6602.spacing = _SafeStr_6614;
                _SafeStr_4477.spacing = _SafeStr_6614;
            }
            else
            {
                if (_arg_1 < _local_2)
                {
                    _SafeStr_6608.spacing = _SafeStr_6617;
                    _SafeStr_6602.spacing = (_SafeStr_6614 - _arg_1);
                    _SafeStr_4477.spacing = (_SafeStr_6614 - _arg_1);
                }
                else
                {
                    if (_arg_1 < (_local_2 + _local_3))
                    {
                        _SafeStr_6608.spacing = _SafeStr_6617;
                        _SafeStr_6602.spacing = _SafeStr_6615;
                        _SafeStr_4477.spacing = _SafeStr_6615;
                    }
                    else
                    {
                        _SafeStr_6608.spacing = _SafeStr_6617;
                        _SafeStr_6602.spacing = _SafeStr_6615;
                        _SafeStr_4477.spacing = _SafeStr_6615;
                    };
                };
            };
        }

        private function adjustScrollbarVisibility():void
        {
            _SafeStr_6608.invalidate();
            if (_SafeStr_6608.height < (topItemListContentHeight - 6))
            {
                _fromTopScrollbar.y = _SafeStr_6608.y;
                _fromTopScrollbar.height = _SafeStr_6608.height;
                _fromTopScrollbar.visible = true;
                _fromTopScrollbar.scrollV = 0;
                _SafeStr_6618.y = topItemListContentHeight;
                _SafeStr_6618.height = 25;
                _layout.landingView.toolbarExtensionExtraMargin = true;
            }
            else
            {
                _SafeStr_6618.y = 0;
                _SafeStr_6618.height = 1;
                _layout.landingView.toolbarExtensionExtraMargin = false;
            };
        }

        private function resetToMaximumSpacing():void
        {
            _SafeStr_6606.spacing = _SafeStr_6612;
            _SafeStr_6602.spacing = _SafeStr_6614;
            _SafeStr_4477.spacing = _SafeStr_6614;
            _SafeStr_6608.spacing = _SafeStr_6616;
            _fromTopScrollbar.visible = false;
            _SafeStr_6602.invalidate();
            _SafeStr_4477.invalidate();
            _SafeStr_6606.invalidate();
            _SafeStr_6608.invalidate();
            _SafeStr_6619.invalidate();
        }

        private function get topItemListContentHeight():int
        {
            var _local_3:int;
            var _local_2:int;
            var _local_1:int;
            _local_3 = 0;
            while (_local_3 < _SafeStr_6608.numListItems)
            {
                _local_2 = _SafeStr_6608.getListItemAt(_local_3).height;
                _local_1 = (_local_1 + _local_2);
                if (_local_3 > 0)
                {
                    _local_1 = (_local_1 + _SafeStr_6608.spacing);
                };
                _local_3++;
            };
            return (_local_1);
        }

        private function contractCenterContainer(_arg_1:_SafeStr_3116=null):void
        {
            if (((!(_arg_1 == null)) && (!(_SafeStr_3853))))
            {
                return;
            };
            _SafeStr_6602.invalidate();
            _SafeStr_4477.invalidate();
            _SafeStr_6606.height = Math.max(_SafeStr_6602.height, _SafeStr_4477.height);
            _SafeStr_6619.height = Math.max(_SafeStr_6602.height, _SafeStr_4477.height);
        }

        public function set ignoreBottomRightSlot(_arg_1:Boolean):void
        {
            _SafeStr_6611 = _arg_1;
        }

        private function logFinalPositions():void
        {
            var _local_2:int;
            _SafeStr_14.log("***** Final positions *****");
            var _local_1:Rectangle = new Rectangle();
            _window.getGlobalRectangle(_local_1);
            _SafeStr_14.log(("Window rect\t\t\t\t\t\t: " + _local_1));
            _SafeStr_6608.getGlobalRectangle(_local_1);
            _SafeStr_14.log(("All items list rect\t\t\t\t: " + _local_1));
            _SafeStr_6619.getGlobalRectangle(_local_1);
            _SafeStr_14.log(("Center container itemlist rect\t: " + _local_1));
            _SafeStr_6606.getGlobalRectangle(_local_1);
            _SafeStr_14.log(("Center itemlist rect\t\t\t: " + _local_1));
            _SafeStr_6602.getGlobalRectangle(_local_1);
            _SafeStr_14.log(("Left pane itemlist rect\t\t\t: " + _local_1));
            _SafeStr_4477.getGlobalRectangle(_local_1);
            _SafeStr_14.log(("Right pane itemlist rect\t\t: " + _local_1));
            _SafeStr_6604.getGlobalRectangle(_local_1);
            _SafeStr_14.log(("Right pane container rect\t\t: " + _local_1));
            _local_2 = 0;
            while (_local_2 < 5)
            {
                _SafeStr_6420[_local_2].getGlobalRectangle(_local_1);
                _SafeStr_14.log(((("Slot " + _local_2) + " rect\t\t\t    : ") + _local_1));
                _local_2++;
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.layout

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3853 = "_-T1w" (String#2104, DoABC#4)
// _SafeStr_4477 = "_-12J" (String#3304, DoABC#4)
// _SafeStr_6296 = "_-42" (String#2661, DoABC#4)
// _SafeStr_6420 = "_-yi" (String#2064, DoABC#4)
// _SafeStr_6602 = "_-12Y" (String#5141, DoABC#4)
// _SafeStr_6603 = "_-Sh" (String#15253, DoABC#4)
// _SafeStr_6604 = "_-Gp" (String#12810, DoABC#4)
// _SafeStr_6605 = "_-d3" (String#14222, DoABC#4)
// _SafeStr_6606 = "_-w3" (String#7353, DoABC#4)
// _SafeStr_6607 = "_-P1Z" (String#21121, DoABC#4)
// _SafeStr_6608 = "_-8m" (String#3217, DoABC#4)
// _SafeStr_6609 = "_-Dj" (String#14476, DoABC#4)
// _SafeStr_6610 = "_-31U" (String#11998, DoABC#4)
// _SafeStr_6611 = "_-S1U" (String#22048, DoABC#4)
// _SafeStr_6612 = "_-fR" (String#14612, DoABC#4)
// _SafeStr_6613 = "_-39" (String#24067, DoABC#4)
// _SafeStr_6614 = "_-W1D" (String#10002, DoABC#4)
// _SafeStr_6615 = "_-27" (String#10784, DoABC#4)
// _SafeStr_6616 = "_-Fu" (String#23538, DoABC#4)
// _SafeStr_6617 = "_-nu" (String#10630, DoABC#4)
// _SafeStr_6618 = "_-AG" (String#10427, DoABC#4)
// _SafeStr_6619 = "_-y1k" (String#13194, DoABC#4)


