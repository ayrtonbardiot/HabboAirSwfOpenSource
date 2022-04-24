// by nota

//com.sulake.habbo.campaign.HabboCampaigns

package com.sulake.habbo.campaign
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.campaign.calendar.CalendarView;
    import _-w1X._SafeStr_1535;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDRoomEngine;
    import __AS3__.vec.Vector;
    import _-TS._SafeStr_672;
    import _-TS._SafeStr_901;
    import _-w1X._SafeStr_1404;
    import _-w1X._SafeStr_1045;
    import _-x1N._SafeStr_595;
    import _-x1N._SafeStr_363;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.room._SafeStr_3248;

    public class HabboCampaigns extends Component implements ILinkEventTracker 
    {

        private var _communicationManager:IHabboCommunicationManager;
        private var _localizationManager:_SafeStr_18;
        private var _sessionDataManager:ISessionDataManager;
        private var _windowManager:_SafeStr_1695;
        private var _catalog:IHabboCatalog;
        private var _roomEngine:IRoomEngine;
        private var _SafeStr_4122:CalendarView;
        private var _SafeStr_4120:_SafeStr_1535;
        private var _SafeStr_4121:int = -1;
        private var _SafeStr_4119:Boolean = false;

        public function HabboCampaigns(_arg_1:_SafeStr_31, _arg_2:uint, _arg_3:IAssetLibrary)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communicationManager = _arg_1;
            }, true), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localizationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboCatalog(), function (_arg_1:IHabboCatalog):void
            {
                _catalog = _arg_1;
            }), new ComponentDependency(new IIDRoomEngine(), function (_arg_1:IRoomEngine):void
            {
                _roomEngine = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_672(onCampaignCalendarDataMessageEvent));
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_901(onCampaignCalendarDoorOpenedMessageEvent));
            context.addLinkEventTracker(this);
        }

        private function onCampaignCalendarDataMessageEvent(_arg_1:_SafeStr_672):void
        {
            var _local_2:_SafeStr_1404 = _arg_1.getParser();
            _SafeStr_4120 = _local_2.cloneData();
        }

        private function onCampaignCalendarDoorOpenedMessageEvent(_arg_1:_SafeStr_901):void
        {
            var _local_2:_SafeStr_1045 = _arg_1.getParser();
            if (_local_2.doorOpened)
            {
                showProductNotification(_local_2.productName, _local_2.customImage, _local_2.furnitureClassName);
            };
        }

        public function openPackage(_arg_1:int):void
        {
            _SafeStr_4121 = _arg_1;
            _communicationManager.connection.send(new _SafeStr_595(_SafeStr_4120.campaignName, _arg_1));
        }

        public function openPackageAsStaff(_arg_1:int):void
        {
            _SafeStr_4121 = _arg_1;
            _communicationManager.connection.send(new _SafeStr_363(_SafeStr_4120.campaignName, _arg_1));
        }

        private function showProductNotification(_arg_1:String, _arg_2:String, _arg_3:String):void
        {
            var _local_4:_SafeStr_3182 = _sessionDataManager.getProductData(_arg_1);
            if (_local_4 != null)
            {
                _SafeStr_4120.openedDays.push(_SafeStr_4121);
                _SafeStr_4121 = -1;
                if (((_arg_2) && (!(_arg_2 == ""))))
                {
                    _SafeStr_4122.setReceivedProduct(_local_4, (getImageGalleryUrl() + _arg_2));
                }
                else
                {
                    if (((_arg_3) && (!(_arg_3 == ""))))
                    {
                        _SafeStr_4122.setReceivedProduct(_local_4);
                        requestIconFromRoomEngine(_SafeStr_4122, _arg_3);
                    };
                };
            };
        }

        private function requestIconFromRoomEngine(_arg_1:_SafeStr_3140, _arg_2:String):_SafeStr_3248
        {
            var _local_3:* = null;
            var _local_4:* = null;
            _local_4 = _sessionDataManager.getFloorItemDataByName(_arg_2);
            if (_local_4)
            {
                _local_3 = _roomEngine.getFurnitureIcon(_local_4.id, _arg_1);
            }
            else
            {
                _local_4 = _sessionDataManager.getWallItemDataByName(_arg_2);
                if (_local_4)
                {
                    _local_3 = _roomEngine.getWallItemIcon(_local_4.id, _arg_1);
                };
            };
            if (((_local_3) && (_local_3.data)))
            {
                _arg_1.imageReady(_local_3.id, _local_3.data);
            };
            return (_local_3);
        }

        public function get linkPattern():String
        {
            return ("openView/");
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_2:Array = _arg_1.split("/");
            if (_local_2.length < 2)
            {
                return;
            };
            if (_local_2[1] == "calendar")
            {
                showCalendar();
            };
        }

        private function showCalendar():void
        {
            if (((!(_SafeStr_4122)) && (_SafeStr_4120)))
            {
                _SafeStr_4122 = new CalendarView(this, _windowManager);
            };
        }

        public function hideCalendar():void
        {
            if (_SafeStr_4122)
            {
                _SafeStr_4122.dispose();
                _SafeStr_4122 = null;
            };
        }

        private function getImageGalleryUrl():String
        {
            return (getProperty("image.library.url"));
        }

        public function get calendarData():_SafeStr_1535
        {
            return (_SafeStr_4120);
        }

        public function get isAnyRoomController():Boolean
        {
            return (_sessionDataManager.isAnyRoomController);
        }

        public function get localizationManager():_SafeStr_18
        {
            return (_localizationManager);
        }


    }
}//package com.sulake.habbo.campaign

// _SafeStr_1045 = "_-oJ" (String#32188, DoABC#4)
// _SafeStr_1404 = "_-b18" (String#37400, DoABC#4)
// _SafeStr_1535 = "_-V1E" (String#9543, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_363 = "_-V3" (String#29594, DoABC#4)
// _SafeStr_4119 = "_-41U" (String#15575, DoABC#4)
// _SafeStr_4120 = "_-d1q" (String#5126, DoABC#4)
// _SafeStr_4121 = "_-71L" (String#9858, DoABC#4)
// _SafeStr_4122 = "_-nE" (String#6718, DoABC#4)
// _SafeStr_595 = "_-i1d" (String#29876, DoABC#4)
// _SafeStr_672 = "_-i0" (String#24319, DoABC#4)
// _SafeStr_901 = "_-3S" (String#24340, DoABC#4)


