// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.campaign.calendar.CalendarView

package com.sulake.habbo.campaign.calendar
{
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.campaign.HabboCampaigns;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.Stage;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import flash.display.BitmapData;
    import com.sulake.core.window._SafeStr_3109;
    import flash.events.Event;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.IItemListWindow;
    import _-w1X._SafeStr_1535;

    public class CalendarView implements _SafeStr_3140 
    {

        private static const MARGIN:int = 75;

        private var _SafeStr_4360:HabboCampaigns;
        private var _SafeStr_5302:IModalDialog;
        private var _SafeStr_6006:int = -1;
        private var _itemsOnScreen:int;

        public function CalendarView(_arg_1:HabboCampaigns, _arg_2:_SafeStr_1695)
        {
            var _local_7:int;
            var _local_5:* = null;
            super();
            _SafeStr_4360 = _arg_1;
            _SafeStr_5302 = _arg_2.buildModalDialogFromXML(XML(_SafeStr_4360.assets.getAssetByName("campaign_calendar_xml").content));
            if ((((!(_SafeStr_5302)) || (!(_SafeStr_5302.rootWindow))) || (!(itemList))))
            {
                return;
            };
            var _local_3:_SafeStr_3133 = (itemList.getListItemAt(0) as _SafeStr_3133);
            itemList.removeListItems();
            itemList.disableAutodrag = true;
            var _local_6:int = calendarData.campaignDays;
            _local_7 = 0;
            while (_local_7 < _local_6)
            {
                _local_5 = CalendarItem.populateItem(_local_3, calendarData, _local_7);
                _local_5.procedure = onInput;
                itemList.addListItem(_local_5);
                _local_7++;
            };
            itemList.scrollStepH = (_local_3.width / itemList.maxScrollH);
            var _local_4:Stage = _SafeStr_4360.context.displayObjectContainer.stage;
            _local_4.addEventListener("resize", onResize);
            window.procedure = onInput;
            onResize(null);
            setSelectedIndex(_SafeStr_4360.calendarData.currentDay);
        }

        public function dispose():void
        {
            var _local_1:* = null;
            if (_SafeStr_5302 != null)
            {
                _local_1 = _SafeStr_4360.context.displayObjectContainer.stage;
                _local_1.removeEventListener("resize", onResize);
                _SafeStr_5302.dispose();
                _SafeStr_5302 = null;
            };
        }

        public function setReceivedProduct(_arg_1:_SafeStr_3182, _arg_2:String=null):void
        {
            setInfoText("${campaign.calendar.heading.product.received}", _arg_1.name);
            updateThumbnail(_arg_2);
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            updateThumbnail(_arg_2);
        }

        private function updateThumbnail(_arg_1:Object):void
        {
            var _local_2:_SafeStr_3133 = (itemList.getListItemAt(_SafeStr_6006) as _SafeStr_3133);
            if (!_local_2)
            {
                return;
            };
            CalendarItem.updateThumbnail(_local_2, _arg_1);
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        public function hide():void
        {
            _SafeStr_4360.hideCalendar();
        }

        private function onResize(_arg_1:Event):void
        {
            var _local_2:Stage = _SafeStr_4360.context.displayObjectContainer.stage;
            _itemsOnScreen = Math.floor(((_local_2.stageWidth - (75 * 2)) / (itemWidth + itemGap)));
            _SafeStr_5302.rootWindow.width = calculateItemListWidth(_itemsOnScreen);
            var _local_3:_SafeStr_3109 = window.findChildByName("btn_forward");
            if (_local_3)
            {
                _local_3.x = ((scrollerWidth - window.findChildByName("btn_back").x) - _local_3.width);
            };
            _local_3 = window.findChildByName("calendar_scrollbar");
            if (_local_3)
            {
                _local_3.width = scrollerWidth;
            };
            window.center();
            if (_SafeStr_6006 > -1)
            {
                setSelectedIndex(_SafeStr_6006);
            };
        }

        private function onInput(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:int;
            if (_arg_1.type != "WME_DOWN")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "btn_present":
                    _local_3 = itemList.getListItemIndex(_arg_1.target.parent);
                    if (_local_3 < 0)
                    {
                        return;
                    };
                    if (_local_3 != _SafeStr_6006)
                    {
                        setSelectedIndex(_local_3);
                    }
                    else
                    {
                        _SafeStr_4360.openPackage(_SafeStr_6006);
                    };
                    return;
                case "btn_back":
                    setSelectedIndex((_SafeStr_6006 - 1));
                    return;
                case "btn_forward":
                    setSelectedIndex((_SafeStr_6006 + 1));
                    return;
                case "btn_force_open":
                    _SafeStr_4360.openPackageAsStaff(_SafeStr_6006);
                    return;
                case "header_button_close":
                    hide();
                    return;
            };
        }

        private function setSelectedIndex(_arg_1:int):void
        {
            var _local_6:int;
            var _local_2:* = null;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_4:* = null;
            if (((_arg_1 < 0) || (_arg_1 >= calendarData.campaignDays)))
            {
                return;
            };
            _SafeStr_6006 = _arg_1;
            itemList.scrollH = calculateCenteredItemScrollH(_SafeStr_6006);
            _local_6 = 0;
            while (_local_6 < calendarData.campaignDays)
            {
                _local_2 = (itemList.getListItemAt(_local_6) as _SafeStr_3133);
                CalendarItem.updateState(_local_2, calendarData, _local_6, _arg_1);
                _local_6++;
            };
            CalendarSpinnerUtil.createGradients(this, _SafeStr_6006);
            if (_SafeStr_4360.isAnyRoomController)
            {
                _local_7 = (window.findChildByName("btn_force_open") as _SafeStr_3122);
                _local_7.visible = true;
            };
            var _local_3:int = CalendarItem.resolveDayState(calendarData, _arg_1);
            if (_SafeStr_6006 < 0)
            {
                setInfoText(null, null);
                if (_local_7)
                {
                    _local_7.disable();
                };
            }
            else
            {
                switch (_local_3)
                {
                    case 2:
                        _local_5 = "${campaign.calendar.info.available.desktop}";
                        break;
                    case 3:
                        _local_5 = "${campaign.calendar.info.expired}";
                        break;
                    case 4:
                        _local_5 = "${campaign.calendar.info.future}";
                        break;
                    case 1:
                        _local_5 = "${campaign.calendar.info.unlocked}";
                    default:
                };
                _local_4 = ((_SafeStr_4360.localizationManager.getLocalization("campaign.calendar.heading.day")) || (""));
                _local_4 = _local_4.replace("%number%", (_SafeStr_6006 + 1));
                setInfoText(_local_4, _local_5);
                if (_local_7)
                {
                    if (_local_3 != 1)
                    {
                        _local_7.enable();
                    }
                    else
                    {
                        _local_7.disable();
                    };
                };
            };
        }

        private function setInfoText(_arg_1:String, _arg_2:String):void
        {
            (window.findChildByName("info_heading") as ITextWindow).text = ((_arg_1) || (""));
            (window.findChildByName("info_body") as ITextWindow).text = ((_arg_2) || (""));
        }

        private function startItemWiggle(_arg_1:int):void
        {
        }

        public function get window():_SafeStr_3263
        {
            return ((_SafeStr_5302) ? (_SafeStr_5302.rootWindow as _SafeStr_3263) : null);
        }

        private function getItemIndexAt(_arg_1:int):int
        {
            return (Math.floor((((itemList.scrollH * itemList.maxScrollH) + _arg_1) / ((itemList.maxScrollH + scrollerWidth) / itemList.numListItems))));
        }

        private function calculateCenteredItemScrollH(_arg_1:int):Number
        {
            return ((calculateItemListWidth(_arg_1) - ((scrollerWidth - itemWidth) * 0.5)) / itemList.maxScrollH);
        }

        public function calculateItemListWidth(_arg_1:int):Number
        {
            return ((_arg_1 * itemWidth) + (Math.max(0, (_arg_1 - 1)) * itemGap));
        }

        public function get itemList():IItemListWindow
        {
            return ((window) ? (window.findChildByName("calendar_itemlist") as IItemListWindow) : null);
        }

        public function get itemWidth():int
        {
            return (((itemList) && (itemList.numListItems > 0)) ? itemList.getListItemAt(0).width : 0);
        }

        public function get itemGap():int
        {
            return ((itemList) ? itemList.spacing : 0);
        }

        public function get scrollerWidth():int
        {
            return (((window) && (window.content)) ? window.content.width : 0);
        }

        private function get calendarData():_SafeStr_1535
        {
            return (_SafeStr_4360.calendarData);
        }


    }
}//package com.sulake.habbo.campaign.calendar

// _SafeStr_1535 = "_-V1E" (String#9543, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_5302 = "_-H8" (String#1949, DoABC#4)
// _SafeStr_6006 = "_-qO" (String#2810, DoABC#4)


