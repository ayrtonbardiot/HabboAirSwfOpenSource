// by nota

//com.sulake.habbo.navigator.mainview.MainViewCtrl

package com.sulake.habbo.navigator.mainview
{
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.runtime._SafeStr_13;
    import flash.geom.Point;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.navigator.TextSearchInputs;
    import flash.utils.Timer;
    import com.sulake.habbo.utils.WindowToggle;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.navigator.IViewCtrl;
    import com.sulake.habbo.navigator.domain.Tab;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import flash.events.Event;
    import _-M1k._SafeStr_1018;
    import com.sulake.core.utils.ErrorReportStorage;
    import _-M1k._SafeStr_135;
    import _-M1k._SafeStr_348;
    import _-M1k._SafeStr_436;
    import _-M1k._SafeStr_757;
    import _-M1k._SafeStr_532;
    import _-M1k._SafeStr_610;
    import _-M1k._SafeStr_519;
    import _-M1k._SafeStr_820;
    import _-M1k._SafeStr_190;
    import _-M1k._SafeStr_612;
    import _-M1k._SafeStr_297;
    import _-M1k._SafeStr_198;
    import _-M1k._SafeStr_395;
    import _-M1k._SafeStr_239;
    import _-M1k._SafeStr_719;
    import _-M1k._SafeStr_254;
    import _-M1k._SafeStr_813;
    import com.sulake.core.communication.messages.IMessageComposer;
    import flash.events.TimerEvent;

    public class MainViewCtrl implements ITransitionalMainViewCtrl, _SafeStr_41, _SafeStr_13 
    {

        public static const SEARCHMSG_SEARCH:int = 1;
        public static const _SafeStr_8663:int = 2;
        public static const SEARCHMSG_OFFICIALROOMS:int = 4;
        public static const _SafeStr_8664:int = 5;
        private static const BLEND_STAGE_BLENDING_OUT:int = 1;
        private static const BLEND_STAGE_LOADING:int = 2;
        private static const BLEND_STAGE_REFRESHING:int = 3;
        private static const BLEND_STAGE_BLENDING_IN:int = 4;
        private static const SCROLLBAR_WIDTH:int = 22;
        private static const PANIC_BUTTON_HEIGHT:int = 60;

        private const DEFAULT_VIEW_LOCATION:Point = new Point(100, 10);

        private var _navigator:HabboNavigator;
        private var _SafeStr_4079:_SafeStr_3263;
        private var _content:_SafeStr_3133;
        private var _SafeStr_4086:_SafeStr_3133;
        private var _footer:_SafeStr_3133;
        private var _SafeStr_4087:_SafeStr_3133;
        private var _SafeStr_4081:PopularTagsListCtrl;
        private var _guestRooms:GuestRoomListCtrl;
        private var _officialRooms:OfficialRoomListCtrl;
        private var _SafeStr_4082:RoomAdListCtrl;
        private var _SafeStr_4084:CategoryListCtrl;
        private var _tabContext:ITabContextWindow;
        private var _SafeStr_4089:Boolean;
        private var _SafeStr_4090:int;
        private var _SafeStr_4091:Boolean = true;
        private var _SafeStr_4092:int = 0;
        private var _loadingText:_SafeStr_3109;
        private var _SafeStr_4088:int = 0;
        private var _SafeStr_4083:TextSearchInputs;
        private var _SafeStr_4078:Timer;
        private var _disposed:Boolean = false;
        private var _SafeStr_4080:WindowToggle;
        private var _SafeStr_4085:Boolean = false;

        public function MainViewCtrl(_arg_1:HabboNavigator):void
        {
            _navigator = _arg_1;
            _SafeStr_4081 = new PopularTagsListCtrl(_navigator);
            _guestRooms = new GuestRoomListCtrl(_navigator, 0, false);
            _officialRooms = new OfficialRoomListCtrl(_navigator);
            _SafeStr_4082 = new RoomAdListCtrl(_navigator, 0, false);
            _SafeStr_4084 = new CategoryListCtrl(_navigator);
            _SafeStr_4078 = new Timer(300, 1);
            _SafeStr_4078.addEventListener("timer", onResizeTimer);
        }

        private static function refreshScrollbar(_arg_1:IViewCtrl, _arg_2:Boolean):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            if (((_arg_1.content == null) || (!(_arg_1.content.visible))))
            {
                return;
            };
            _local_4 = IItemListWindow(_arg_1.content.findChildByName("item_list"));
            _local_5 = _arg_1.content.findChildByName("scroller");
            var _local_3:* = (_local_4.scrollableRegion.height > _local_4.height);
            if (_local_5.visible)
            {
                if (!_local_3)
                {
                    _local_5.visible = false;
                    _local_4.width = (_local_4.width + 22);
                };
            }
            else
            {
                if (_local_3)
                {
                    _local_5.visible = true;
                    _local_4.width = (_local_4.width - 22);
                };
            };
        }

        public static function stretchNewEntryIfNeeded(_arg_1:IViewCtrl, _arg_2:_SafeStr_3133):void
        {
            var _local_3:_SafeStr_3109 = _arg_1.content.findChildByName("scroller");
            if (((_local_3 == null) || (_local_3.visible)))
            {
                return;
            };
            _arg_2.width = (_arg_2.width + 22);
        }


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function onNavigatorToolBarIconClick():void
        {
            if (!_SafeStr_4079)
            {
                reloadData();
                return;
            };
            if (((!(_SafeStr_4080)) || (_SafeStr_4080.disposed)))
            {
                _SafeStr_4080 = new WindowToggle(_SafeStr_4079, _SafeStr_4079.desktop, reloadData, close);
            };
            _SafeStr_4080.toggle();
        }

        private function reloadData():void
        {
            var _local_1:Tab = _navigator.tabs.getSelected();
            _local_1.tabPageDecorator.navigatorOpenedWhileInTab();
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _disposed = true;
                _navigator = null;
                if (_SafeStr_4079)
                {
                    _SafeStr_4079.dispose();
                    _SafeStr_4079 = null;
                };
                if (_SafeStr_4080)
                {
                    _SafeStr_4080.dispose();
                    _SafeStr_4080 = null;
                };
                if (_content)
                {
                    _content.dispose();
                    _content = null;
                };
                if (_SafeStr_4078)
                {
                    _SafeStr_4078.removeEventListener("timer", onResizeTimer);
                    _SafeStr_4078.reset();
                    _SafeStr_4078 = null;
                };
                if (_SafeStr_4081)
                {
                    _SafeStr_4081.dispose();
                    _SafeStr_4081 = null;
                };
                if (_guestRooms)
                {
                    _guestRooms.dispose();
                    _guestRooms = null;
                };
                if (_officialRooms)
                {
                    _officialRooms.dispose();
                    _officialRooms = null;
                };
                if (_SafeStr_4082)
                {
                    _SafeStr_4082.dispose();
                    _SafeStr_4082 = null;
                };
                if (_SafeStr_4083)
                {
                    _SafeStr_4083.dispose();
                    _SafeStr_4083 = null;
                };
            };
        }

        public function open():void
        {
            if (_SafeStr_4079 == null)
            {
                prepare();
            };
            refresh();
            _SafeStr_4079.visible = true;
            _SafeStr_4079.y = Math.max(_SafeStr_4079.y, 60);
            _SafeStr_4079.activate();
        }

        public function isOpen():Boolean
        {
            return ((!(_SafeStr_4079 == null)) && (_SafeStr_4079.visible));
        }

        public function close():void
        {
            if (_SafeStr_4079 != null)
            {
                if (_SafeStr_4083)
                {
                    _SafeStr_4083.dispose();
                    _SafeStr_4083 = null;
                };
                if (_SafeStr_4080)
                {
                    _SafeStr_4080.dispose();
                    _SafeStr_4080 = null;
                };
                _SafeStr_4079.dispose();
                _SafeStr_4079 = null;
                _tabContext = null;
                _content = null;
                _SafeStr_4086 = null;
                _SafeStr_4087 = null;
                _footer = null;
                _loadingText = null;
                _SafeStr_4081.content = null;
                _guestRooms.content = null;
                _officialRooms.content = null;
                _SafeStr_4084.content = null;
                _SafeStr_4082.content = null;
                _SafeStr_4088 = 0;
            };
        }

        public function get mainWindow():_SafeStr_3263
        {
            return (_SafeStr_4079);
        }

        private function prepare():void
        {
            var _local_4:* = null;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_2:Boolean = _navigator.getBoolean("eventinfo.enabled");
            var _local_6:Boolean;
            _SafeStr_4079 = _SafeStr_3263(_navigator.getXmlWindow("grs_main_window_new"));
            _tabContext = ITabContextWindow(_SafeStr_4079.findChildByName("tab_context"));
            _content = _SafeStr_3133(_SafeStr_4079.findChildByName("tab_content"));
            _SafeStr_4086 = _SafeStr_3133(_SafeStr_4079.findChildByName("custom_content"));
            _SafeStr_4087 = _SafeStr_3133(_SafeStr_4079.findChildByName("list_content"));
            _footer = _SafeStr_3133(_SafeStr_4079.findChildByName("custom_footer"));
            _loadingText = _SafeStr_4079.findChildByName("loading_text");
            var _local_3:_SafeStr_3109 = _SafeStr_4079.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener("WME_CLICK", onWindowClose);
            };
            _SafeStr_4079.addEventListener("WE_RESIZED", onWindowResized);
            if (((!(_local_2)) || (!(_SafeStr_4085))))
            {
                _local_4 = [];
                while (_tabContext.numTabItems > 0)
                {
                    _local_7 = _tabContext.getTabItemAt(0);
                    _local_4.push(_local_7);
                    _tabContext.removeTabItem(_local_7);
                };
                for each (_local_7 in _local_4)
                {
                    if (!(((_local_7.id == 1) && (!(_local_2))) || ((_local_7.id == 6) && (!(_local_6)))))
                    {
                        _tabContext.addTabItem(_local_7);
                    };
                };
            };
            for each (var _local_1:Tab in _navigator.tabs.tabs)
            {
                _local_5 = _tabContext.getTabItemByID(_local_1.id);
                if (_local_5 != null)
                {
                    _local_5.addEventListener("WE_SELECTED", onTabSelected);
                    _local_1.button = _local_5;
                };
            };
            _SafeStr_4079.scaler.setParamFlag(0x3000, false);
            _SafeStr_4079.scaler.setParamFlag(0x2000, true);
            _SafeStr_4079.position = DEFAULT_VIEW_LOCATION;
            createSearchInput();
        }

        private function createSearchInput():void
        {
            var _local_1:* = null;
            var _local_2:String = "search_header";
            if (_SafeStr_4083 == null)
            {
                _local_1 = (_SafeStr_4079.findChildByName(_local_2) as _SafeStr_3133);
                _SafeStr_4083 = new TextSearchInputs(_navigator, _local_1);
            };
            var _local_3:_SafeStr_3133 = (_SafeStr_4079.findChildByName(_local_2) as _SafeStr_3133);
            _local_3.visible = true;
        }

        public function refresh():void
        {
            if (_SafeStr_4079 == null)
            {
                return;
            };
            refreshTab();
            refreshCustomContent();
            refreshListContent(true);
            refreshFooter();
            _SafeStr_4086.height = Util.getLowestPoint(_SafeStr_4086);
            _footer.height = Util.getLowestPoint(_footer);
            var _local_1:int = _SafeStr_4087.y;
            Util.moveChildrenToColumn(_content, ["custom_content", "list_content"], _SafeStr_4086.y, 8);
            _SafeStr_4087.height = ((((_SafeStr_4087.height + _local_1) - _SafeStr_4087.y) - _footer.height) + _SafeStr_4088);
            Util.moveChildrenToColumn(_content, ["list_content", "custom_footer"], _SafeStr_4087.y, 0);
            _SafeStr_4088 = _footer.height;
            onResizeTimer(null);
        }

        private function refreshTab():void
        {
            var _local_2:Tab = _navigator.tabs.getSelected();
            var _local_1:ISelectableWindow = _tabContext.selector.getSelected();
            if (_local_2.button != _local_1)
            {
                _SafeStr_4089 = true;
                _tabContext.selector.setSelected(_local_2.button);
            };
        }

        private function refreshCustomContent():void
        {
            Util.hideChildren(_SafeStr_4086);
            var _local_1:Tab = _navigator.tabs.getSelected();
            _local_1.tabPageDecorator.refreshCustomContent(_SafeStr_4086);
            if (Util.hasVisibleChildren(_SafeStr_4086))
            {
                _SafeStr_4086.visible = true;
            }
            else
            {
                _SafeStr_4086.visible = false;
                _SafeStr_4086.blend = 1;
            };
        }

        private function refreshFooter():void
        {
            Util.hideChildren(_footer);
            var _local_1:Tab = _navigator.tabs.getSelected();
            _local_1.tabPageDecorator.refreshFooter(_footer);
            _footer.visible = Util.hasVisibleChildren(_footer);
        }

        private function refreshListContent(_arg_1:Boolean):void
        {
            Util.hideChildren(_SafeStr_4087);
            var _local_2:Tab = _navigator.tabs.getSelected();
            var _local_3:Boolean = ((_navigator.data.guestRoomSearchArrived) && (_local_2.defaultSearchType == 16));
            refreshRoomAds(_arg_1, _local_3);
            refreshGuestRooms(_arg_1, (!(_local_3)));
            refreshPopularTags(_arg_1, _navigator.data.popularTagsArrived);
            refreshOfficialRooms(_arg_1, _navigator.data.officialRoomsArrived);
        }

        private function refreshGuestRooms(_arg_1:Boolean, _arg_2:Boolean):void
        {
            refreshList(_arg_1, _arg_2, _guestRooms, "guest_rooms");
        }

        private function refreshPopularTags(_arg_1:Boolean, _arg_2:Boolean):void
        {
            refreshList(_arg_1, _arg_2, _SafeStr_4081, "popular_tags");
        }

        private function refreshOfficialRooms(_arg_1:Boolean, _arg_2:Boolean):void
        {
            refreshList(_arg_1, _arg_2, _officialRooms, "official_rooms");
        }

        private function refreshRoomAds(_arg_1:Boolean, _arg_2:Boolean):void
        {
            refreshList(_arg_1, _arg_2, _SafeStr_4082, "room_ads");
        }

        private function refreshCategoryList(_arg_1:Boolean, _arg_2:Boolean):void
        {
            refreshList(_arg_1, _arg_2, _SafeStr_4084, "categories_container");
        }

        private function refreshList(_arg_1:Boolean, _arg_2:Boolean, _arg_3:IViewCtrl, _arg_4:String):void
        {
            var _local_5:* = null;
            if (_arg_2)
            {
                if (_arg_3.content == null)
                {
                    _local_5 = _SafeStr_4087.findChildByName(_arg_4);
                    _arg_3.content = _SafeStr_3133(_local_5);
                };
                if (_arg_1)
                {
                    _arg_3.refresh();
                };
                _arg_3.content.visible = true;
            };
        }

        private function onWindowClose(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_14.log("Close navigator window");
            this.close();
        }

        private function onTabSelected(_arg_1:_SafeStr_3116):void
        {
            var _local_4:_SafeStr_3109 = _arg_1.target;
            var _local_2:int = _local_4.id;
            if (_SafeStr_4089)
            {
                _SafeStr_4089 = false;
                return;
            };
            var _local_3:Tab = _navigator.tabs.getTab(_local_2);
            _local_3.sendSearchRequest();
            switch (_local_3.id)
            {
                case 1:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS"));
                    _navigator.send(new _SafeStr_1018());
                    return;
                case 3:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_ME"));
                    return;
                case 4:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL"));
                    return;
                case 2:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS"));
                    return;
                case 5:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH"));
                    return;
                case 6:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_CATEGORIES"));
                default:
            };
        }

        public function reloadRoomList(_arg_1:int):Boolean
        {
            ErrorReportStorage.addDebugData("MainViewCtrl", "Reloading RoomList");
            if ((((this.isOpen()) && (!(this._navigator.data.guestRoomSearchResults == null))) && (this._navigator.data.guestRoomSearchResults.searchType == _arg_1)))
            {
                startSearch(_navigator.tabs.getSelected().id, _arg_1, "");
                return (true);
            };
            return (false);
        }

        public function startSearch(_arg_1:int, _arg_2:int, _arg_3:String="-1", _arg_4:int=1):void
        {
            var _local_5:Tab = _navigator.tabs.getSelected();
            _navigator.tabs.setSelectedTab(_arg_1);
            var _local_6:Tab = _navigator.tabs.getSelected();
            ErrorReportStorage.addDebugData("StartSearch", ((("Start search " + _local_5.id) + " => ") + _local_6.id));
            if (_SafeStr_4085)
            {
                if (_arg_3.substr(0, 1) == "#")
                {
                    _arg_2 = 9;
                    _arg_3 = _arg_3.substr(1, (_arg_3.length - 1));
                };
            };
            this._SafeStr_4091 = (!(_local_5 == _local_6));
            if (_local_5 != _local_6)
            {
                _local_6.tabPageDecorator.tabSelected();
            };
            _navigator.data.startLoading();
            if (_arg_4 == 1)
            {
                _navigator.send(getSearchMsg(_arg_2, _arg_3));
            }
            else
            {
                if (_arg_4 == 2)
                {
                    _navigator.send(new _SafeStr_135());
                }
                else
                {
                    if (_arg_4 != 5)
                    {
                        _navigator.send(new _SafeStr_348(_navigator.data.adIndex));
                    };
                };
            };
            if (!isOpen())
            {
                open();
                this._SafeStr_4090 = 2;
                this._SafeStr_4087.blend = 0;
                if (this._SafeStr_4086.visible)
                {
                    this._SafeStr_4086.blend = 0;
                    this._footer.blend = 0;
                };
            }
            else
            {
                this._SafeStr_4090 = 1;
            };
            this._SafeStr_4092 = 0;
            _navigator.registerUpdateReceiver(this, 2);
            sendTrackingEvent(_arg_2);
            _navigator.data.competitionRoomsData = null;
            if (_SafeStr_4085)
            {
                if (((!(searchInput == null)) && (!(_arg_3 == "-1"))))
                {
                    if (_arg_2 != 1)
                    {
                        searchInput.setText(_arg_3, _arg_2);
                    };
                };
            };
        }

        private function sendTrackingEvent(_arg_1:int):void
        {
            switch (_arg_1)
            {
                case 6:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES"));
                    return;
                case 3:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS"));
                    return;
                case 7:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY"));
                    return;
                case 5:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS"));
                    return;
                case 11:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS"));
                    return;
                case 1:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS"));
                    return;
                case 4:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE"));
                    return;
                case 2:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE"));
                    return;
                case 9:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH"));
                    return;
                case 8:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH"));
                    return;
                case 23:
                    _navigator.events.dispatchEvent(new Event("HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FREQUENT_HISTORY"));
                    return;
            };
        }

        private function getSearchMsg(_arg_1:int, _arg_2:String):IMessageComposer
        {
            var _local_3:* = null;
            switch (_arg_1)
            {
                case 6:
                    return (new _SafeStr_436());
                case 3:
                    return (new _SafeStr_757());
                case 7:
                    return (new _SafeStr_532());
                case 5:
                    return (new _SafeStr_610());
                case 1:
                    return (new _SafeStr_519(_arg_2, _navigator.data.adIndex));
                case 4:
                    return (new _SafeStr_820());
                case 2:
                    return (new _SafeStr_190(_navigator.data.adIndex));
                case 9:
                    return (new _SafeStr_612(("tag:" + _arg_2)));
                case 8:
                    return (new _SafeStr_612(_arg_2));
                case 13:
                    return (new _SafeStr_612(("group:" + _arg_2)));
                case 10:
                    return (new _SafeStr_612(("roomname:" + _arg_2)));
                case 14:
                    return (new _SafeStr_297(_navigator.data.adIndex));
                case 15:
                    _local_3 = _navigator.data.competitionRoomsData;
                    return (new _SafeStr_198(_local_3.goalId, _local_3.pageIndex));
                case 16:
                case 17:
                    return (new _SafeStr_395(_navigator.data.adIndex, _arg_1));
                case 18:
                    return (new _SafeStr_239());
                case 19:
                    return (new _SafeStr_719());
                case 20:
                    return (new _SafeStr_612(("owner:" + _arg_2)));
                case 22:
                    return (new _SafeStr_254());
                case 23:
                    return (new _SafeStr_813());
            };
            _SafeStr_14.log(("No message for searchType: " + _arg_1));
            return (null);
        }

        public function update(_arg_1:uint):void
        {
            var _local_3:Number;
            if (this._SafeStr_4087 == null)
            {
                return;
            };
            var _local_2:Number = (_arg_1 / 150);
            if (_SafeStr_4090 == 1)
            {
                _local_3 = Math.min(1, Math.max(0, (this._SafeStr_4087.blend - _local_2)));
                this._SafeStr_4087.blend = _local_3;
                this._SafeStr_4086.blend = ((_SafeStr_4091) ? _local_3 : 1);
                this._footer.blend = ((_SafeStr_4091) ? _local_3 : 1);
                if (_local_3 == 0)
                {
                    _SafeStr_4090 = 2;
                };
            }
            else
            {
                if (_SafeStr_4090 == 2)
                {
                    if ((_SafeStr_4092 % 10) == 1)
                    {
                        _loadingText.visible = (!(_loadingText.visible));
                    };
                    _SafeStr_4092++;
                    if (!_navigator.data.isLoading())
                    {
                        _SafeStr_4090 = 3;
                    };
                }
                else
                {
                    if (_SafeStr_4090 == 3)
                    {
                        this.refresh();
                        _SafeStr_4090 = 4;
                    }
                    else
                    {
                        _loadingText.visible = false;
                        _local_3 = Math.min(1, Math.max(0, (this._SafeStr_4087.blend + _local_2)));
                        this._SafeStr_4087.blend = _local_3;
                        this._SafeStr_4086.blend = ((_SafeStr_4091) ? _local_3 : 1);
                        this._footer.blend = ((_SafeStr_4091) ? _local_3 : 1);
                        if (_SafeStr_4087.blend >= 1)
                        {
                            _navigator.removeUpdateReceiver(this);
                        };
                    };
                };
            };
        }

        private function onWindowResized(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.target;
            if (_local_2 != _SafeStr_4079)
            {
                return;
            };
            if (!this._SafeStr_4078.running)
            {
                this._SafeStr_4078.reset();
                this._SafeStr_4078.start();
            };
        }

        private function onResizeTimer(_arg_1:TimerEvent):void
        {
            refreshScrollbar(_SafeStr_4081, false);
            refreshScrollbar(_guestRooms, false);
            refreshScrollbar(_SafeStr_4082, false);
            if (_navigator.isPerkAllowed("NAVIGATOR_PHASE_ONE_2014"))
            {
            };
        }

        public function get searchInput():TextSearchInputs
        {
            return (_SafeStr_4083);
        }

        public function openAtPosition(_arg_1:Point):void
        {
            reloadData();
            if (_arg_1 != null)
            {
                _SafeStr_4079.position = _arg_1;
            }
            else
            {
                if (_SafeStr_4079.position.x == 0)
                {
                    _SafeStr_4079.position = DEFAULT_VIEW_LOCATION;
                };
            };
        }

        public function get isPhaseOneNavigator():Boolean
        {
            return (_SafeStr_4085);
        }


    }
}//package com.sulake.habbo.navigator.mainview

// _SafeStr_1018 = "_-p1T" (String#28631, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_135 = "_-51M" (String#29531, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1559 = "_-S7" (String#12977, DoABC#4)
// _SafeStr_190 = "_-01b" (String#28612, DoABC#4)
// _SafeStr_198 = "_-sg" (String#28462, DoABC#4)
// _SafeStr_239 = "_-o1J" (String#29384, DoABC#4)
// _SafeStr_254 = "_-w9" (String#30390, DoABC#4)
// _SafeStr_297 = "_-81J" (String#29629, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_348 = "_-q1E" (String#29721, DoABC#4)
// _SafeStr_395 = "_-x1n" (String#30147, DoABC#4)
// _SafeStr_4078 = "_-N1D" (String#1602, DoABC#4)
// _SafeStr_4079 = "_-f1q" (String#323, DoABC#4)
// _SafeStr_4080 = "_-D1I" (String#2500, DoABC#4)
// _SafeStr_4081 = "_-L1n" (String#7708, DoABC#4)
// _SafeStr_4082 = "_-u1N" (String#7804, DoABC#4)
// _SafeStr_4083 = "_-01C" (String#5640, DoABC#4)
// _SafeStr_4084 = "_-p1a" (String#15081, DoABC#4)
// _SafeStr_4085 = "_-J1r" (String#15691, DoABC#4)
// _SafeStr_4086 = "_-H2" (String#4352, DoABC#4)
// _SafeStr_4087 = "_-Eb" (String#4052, DoABC#4)
// _SafeStr_4088 = "_-h1B" (String#11661, DoABC#4)
// _SafeStr_4089 = "_-wb" (String#11832, DoABC#4)
// _SafeStr_4090 = "_-ZM" (String#6311, DoABC#4)
// _SafeStr_4091 = "_-110" (String#13054, DoABC#4)
// _SafeStr_4092 = "_-Ro" (String#11939, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_436 = "_-YZ" (String#28495, DoABC#4)
// _SafeStr_519 = "_-12z" (String#29548, DoABC#4)
// _SafeStr_532 = "_-DI" (String#30013, DoABC#4)
// _SafeStr_610 = "_-f13" (String#30403, DoABC#4)
// _SafeStr_612 = "_-lR" (String#7726, DoABC#4)
// _SafeStr_719 = "_-i7" (String#31485, DoABC#4)
// _SafeStr_757 = "_-9v" (String#30815, DoABC#4)
// _SafeStr_813 = "_-q1L" (String#29666, DoABC#4)
// _SafeStr_820 = "_-t1E" (String#28894, DoABC#4)
// _SafeStr_8663 = "_-A1i" (String#33950, DoABC#4)
// _SafeStr_8664 = "_-K1v" (String#39768, DoABC#4)


