// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.view.NavigatorView

package com.sulake.habbo.navigator.view
{
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.habbo.navigator.view.search.SearchView;
    import com.sulake.habbo.navigator.view.search.results.BlockResultsView;
    import com.sulake.habbo.navigator.view.search.results.RoomEntryElementFactory;
    import com.sulake.habbo.navigator.view.search.results.CategoryElementFactory;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.getTimer;
    import com.sulake.core.window._SafeStr_3109;
    import flash.geom.Rectangle;
    import __AS3__.vec.Vector;
    import _-21f._SafeStr_1598;
    import com.sulake.habbo.navigator.view.search.ViewMode;
    import _-21f._SafeStr_3197;
    import _-Ja._SafeStr_1569;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.IScrollableListWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.components.ITabButtonWindow;
    import com.sulake.core.window.events._SafeStr_3116;

    public class NavigatorView implements _SafeStr_41 
    {

        private static const POPUP_HIDE_DELAY_MS:uint = 4000;
        private static const MAX_WINDOW_WIDTH:int = 578;
        private static const STARTING_TAB_POSITION:int = 115;
        private static const _SafeStr_8668:int = 7;
        private static const _SafeStr_8669:int = 7;

        private var _navigator:HabboNewNavigator;
        private var _SafeStr_4476:LiftView;
        private var _SafeStr_4472:QuickLinksView;
        private var _SafeStr_4475:SearchView;
        private var _SafeStr_4474:BlockResultsView;
        private var _SafeStr_4470:RoomEntryElementFactory;
        private var _SafeStr_4471:CategoryElementFactory;
        private var _SafeStr_4336:TopViewSelector;
        private var _roomInfoPopup:RoomInfoPopup;
        private var _SafeStr_8670:_SafeStr_3195;
        private var _SafeStr_8671:_SafeStr_3195;
        private var _SafeStr_8672:_SafeStr_3195;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4473:Boolean;
        private var _SafeStr_4483:uint = getTimer();
        private var _SafeStr_4478:int = -1;
        private var _SafeStr_4479:int = -1;
        private var _lastWindowWidth:int = -1;
        private var _SafeStr_4480:int = -1;
        private var _lastLeftPaneHidden:Boolean = false;
        private var _waitingForGroupDetails:int = -1;
        private var _SafeStr_4484:int = 4000;
        private var _SafeStr_8673:Boolean = false;
        private var _SafeStr_4482:int;
        private var _SafeStr_4481:int;
        private var _SafeStr_4477:_SafeStr_3109;
        private var _leftPaneMargin:int;
        private var roomInfoGlobalRectangle:Rectangle = new Rectangle();

        public function NavigatorView(_arg_1:HabboNewNavigator)
        {
            _navigator = _arg_1;
        }

        public function set visible(_arg_1:Boolean):void
        {
            if (((_arg_1) && (_navigator.isReady)))
            {
                if (_SafeStr_4470 == null)
                {
                    _SafeStr_4470 = new RoomEntryElementFactory(_navigator);
                };
                if (_SafeStr_4471 == null)
                {
                    _SafeStr_4471 = new CategoryElementFactory(_navigator, _SafeStr_4470);
                };
                createSubViews();
                if (_window == null)
                {
                    createMainWindow();
                    _navigator.registerUpdateReceiver(this, 1000);
                    _SafeStr_4472.setQuickLinks(_navigator.contextContainer.savedSearches);
                };
                if (_navigator.currentResults != null)
                {
                    this.onSearchResults(_navigator.currentResults);
                }
                else
                {
                    if (!_SafeStr_4473)
                    {
                        _navigator.performSearch("official_view");
                    };
                };
                _window.activate();
            }
            else
            {
                if (_roomInfoPopup)
                {
                    _roomInfoPopup.show(false);
                };
            };
            if (_window)
            {
                _window.visible = _arg_1;
            };
        }

        public function get visible():Boolean
        {
            if (_window)
            {
                return (_window.visible);
            };
            return (false);
        }

        public function setInitialWindowDimensions(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:int):void
        {
            if (_window)
            {
                setLeftPaneVisibility((!(_arg_4)));
                _window.x = _arg_1;
                _window.y = _arg_2;
                _window.height = _arg_3;
            }
            else
            {
                _SafeStr_4478 = _arg_1;
                _SafeStr_4479 = _arg_2;
                _SafeStr_4480 = _arg_3;
                _lastLeftPaneHidden = _arg_4;
            };
        }

        public function onSavedSearches(_arg_1:Vector.<_SafeStr_1598>):void
        {
            if (_SafeStr_4472)
            {
                _SafeStr_4472.setQuickLinks(_arg_1);
            };
        }

        private function createSubViews():void
        {
            if (_SafeStr_4474 == null)
            {
                _SafeStr_4474 = new BlockResultsView(_navigator);
                _SafeStr_4474.categoryElementFactory = _SafeStr_4471;
                _SafeStr_4471.blockResultsView = _SafeStr_4474;
            };
            if (_SafeStr_4475 == null)
            {
                _SafeStr_4475 = new SearchView(_navigator);
            };
            if (_SafeStr_4472 == null)
            {
                _SafeStr_4472 = new QuickLinksView(_navigator);
            };
            if (_SafeStr_4476 == null)
            {
            };
            if (_SafeStr_4336 == null)
            {
                _SafeStr_4336 = new TopViewSelector(_navigator);
            };
        }

        public function onSearchResults(_arg_1:_SafeStr_3197, _arg_2:String=""):void
        {
            var _local_3:int;
            if (_navigator.newResultsRendered)
            {
                return;
            };
            if (((!(_SafeStr_4470)) || (!(_SafeStr_4474))))
            {
                return;
            };
            _SafeStr_4470.viewMode = ViewMode.getViewMode(_arg_1.searchCodeOriginal);
            _SafeStr_4474.displayCurrentResults();
            if (_navigator.contextContainer.hasContextFor(_arg_1.searchCodeOriginal))
            {
                _local_3 = _navigator.contextContainer.getTopLevelSearches().indexOf(_arg_1.searchCodeOriginal);
                if (_local_3 != -1)
                {
                    _SafeStr_4336.selectTabByIndex(_local_3);
                };
            };
            _window.findChildByName("create_room").procedure = createRoomProcedure;
            _window.findChildByName("random_room_border").visible = false;
            _window.findChildByName("promote_room_border").visible = false;
            if (((_arg_1.searchCodeOriginal == "roomads_view") || (_arg_1.searchCodeOriginal == "myworld_view")))
            {
                _window.findChildByName("promote_room_border").visible = true;
                _window.findChildByName("promote_room").procedure = promoteRoomProcedure;
            }
            else
            {
                _window.findChildByName("random_room_border").visible = true;
                _window.findChildByName("random_room").procedure = randomRoomProcedure;
            };
            _SafeStr_4475.setTextAndSearchModeFromFilter(_arg_1.filteringData, _arg_2);
            _navigator.newResultsRendered = true;
            isBusy = false;
            if (_roomInfoPopup)
            {
                _roomInfoPopup.show(false);
            };
        }

        public function currentFilterText():String
        {
            if (_SafeStr_4475 != null)
            {
                return (_SafeStr_4475.currentInput);
            };
            return (null);
        }

        public function refreshLiftedRooms():void
        {
            if (_SafeStr_4476)
            {
                _SafeStr_4476.refresh();
            };
        }

        public function showRoomInfoBubbleAt(_arg_1:_SafeStr_1569, _arg_2:int, _arg_3:int, _arg_4:Boolean=false):void
        {
            _SafeStr_8673 = true;
            if (!_window)
            {
                return;
            };
            if (!_roomInfoPopup)
            {
                _roomInfoPopup = new RoomInfoPopup(_navigator);
            };
            if (((_roomInfoPopup.visible) && (!(_arg_4))))
            {
                _roomInfoPopup.show(false);
            }
            else
            {
                _roomInfoPopup.setData(_arg_1);
                if (((!(_arg_1.habboGroupId == 0)) && (_navigator.getCachedGroupDetails(_arg_1.habboGroupId) == null)))
                {
                    _navigator.getGuildInfo(_arg_1.habboGroupId, false);
                    _waitingForGroupDetails = _arg_1.habboGroupId;
                };
                _roomInfoPopup.showAt(true, _arg_2, _arg_3);
                _navigator.trackEventLog("browse.openroominfo", "Results", _arg_1.roomName, _arg_1.flatId);
                _SafeStr_4484 = 4000;
            };
        }

        public function get mainWindow():_SafeStr_3263
        {
            return (_window as _SafeStr_3263);
        }

        public function set isBusy(_arg_1:Boolean):void
        {
            if (_window)
            {
                _window.caption = ((_arg_1) ? "${navigator.title.is.busy}" : "${navigator.title}");
                _window.findChildByName("search_waiting_for_results_mask").visible = _arg_1;
            };
            _SafeStr_4473 = _arg_1;
        }

        public function get isBusy():Boolean
        {
            return (_SafeStr_4473);
        }

        private function createMainWindow():void
        {
            var _local_8:_SafeStr_3133 = _SafeStr_3133(_navigator.windowManager.buildFromXML(XML(_navigator.assets.getAssetByName("navigator_frame_2_xml").content)));
            IScrollableListWindow(_local_8.findChildByName("block_results")).autoHideScrollBar = false;
            var _local_10:_SafeStr_3133 = _SafeStr_3133(_local_8.findChildByName("navigator_entry_row_container"));
            _SafeStr_4470.rowEntryTemplate = _SafeStr_3133(_local_10.clone());
            _local_10.destroy();
            var _local_4:IItemListWindow = IItemListWindow(_local_8.findChildByName("navigator_entry_tile_container").clone());
            var _local_5:_SafeStr_3133 = _SafeStr_3133(_local_4.getListItemByName("navigator_entry_tile").clone());
            _SafeStr_4470.tileEntryTemplate = _local_5;
            _local_4.destroyListItems();
            _SafeStr_4470.tileContainerTemplate = _local_4;
            IItemListWindow(_local_8.findChildByName("category_content")).destroyListItems();
            var _local_9:_SafeStr_3133 = _SafeStr_3133(_local_8.findChildByName("category_container"));
            _SafeStr_4471.categoryTemplate = _SafeStr_3133(_local_9.clone());
            IItemListWindow(_local_8.findChildByName("block_results")).removeListItemAt(0);
            _local_9.destroy();
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_local_8.findChildByName("category_container_collapsed"));
            _SafeStr_4471.collapsedCategoryTemplate = _SafeStr_3133(_local_1.clone());
            IItemListWindow(_local_8.findChildByName("block_results")).removeListItemAt(0);
            _local_1.destroy();
            var _local_6:_SafeStr_3133 = _SafeStr_3133(_local_8.findChildByName("no_results_container"));
            _SafeStr_4471.noResultsTemplate = _SafeStr_3133(_local_6.clone());
            IItemListWindow(_local_8.findChildByName("block_results")).removeListItemAt(0);
            _local_6.destroy();
            _SafeStr_4474.itemList = IItemListWindow(_local_8.findChildByName("block_results"));
            _SafeStr_4475.container = _SafeStr_3133(_local_8.findChildByName("search_tools"));
            var _local_3:IRegionWindow = IRegionWindow(_local_8.findChildByName("quick_link"));
            _local_3.findChildByName("quick_link_text").caption = "";
            _SafeStr_4472.template = IRegionWindow(_local_3.clone());
            _SafeStr_4472.itemList = IItemListWindow(_local_8.findChildByName("quicklinks_list"));
            IItemListWindow(_local_8.findChildByName("quicklinks_list")).removeListItems();
            _local_3.destroy();
            var _local_2:ITabContextWindow = ITabContextWindow(_local_8.findChildByName("top_view_select_tab_context"));
            var _local_7:ITabButtonWindow = ITabButtonWindow(_local_2.getTabItemAt(0).clone());
            _SafeStr_4336.template = _local_7;
            _SafeStr_4336.tabContext = _local_2;
            _local_2.removeTabItem(_local_7);
            _SafeStr_4336.refresh();
            _SafeStr_8670 = _SafeStr_3195(_local_8.findChildByName("create_room_border").clone());
            IItemListWindow(_local_8.findChildByName("left_pane")).removeListItem(_local_8.findChildByName("create_room_border"));
            _SafeStr_8671 = _SafeStr_3195(_local_8.findChildByName("promote_room_border").clone());
            IItemListWindow(_local_8.findChildByName("left_pane")).removeListItem(_local_8.findChildByName("promote_room_border"));
            _SafeStr_8672 = _SafeStr_3195(_local_8.findChildByName("random_room_border").clone());
            IItemListWindow(_local_8.findChildByName("left_pane")).removeListItem(_local_8.findChildByName("random_room_border"));
            _leftPaneMargin = _local_8.findChildByName("left_pane").x;
            _local_8.findChildByName("refreshButton").procedure = refreshSearchResults;
            _local_8.findChildByName("header_button_close").procedure = headerProcedure;
            _SafeStr_4482 = 7;
            _local_8.findChildByName("temp_back").procedure = leftPaneShowHideProcedure;
            _SafeStr_4477 = _local_8.findChildByName("right_pane");
            _SafeStr_4481 = _SafeStr_4477.x;
            _window = _local_8;
            setLeftPaneVisibility(false);
            if (((_SafeStr_4478 == -1) && (_SafeStr_4479 == -1)))
            {
                _SafeStr_4478 = _window.x;
                _SafeStr_4479 = _window.y;
                _lastWindowWidth = _window.width;
                _SafeStr_4480 = _window.height;
            }
            else
            {
                if (_lastLeftPaneHidden)
                {
                    setLeftPaneVisibility(true);
                };
                _window.x = _SafeStr_4478;
                _window.y = _SafeStr_4479;
                _window.height = _SafeStr_4480;
            };
            _SafeStr_4483 = getTimer();
        }

        private function refreshSearchResults(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((_arg_1.type == "WME_CLICK") && (_arg_2.name == "refreshButton")))
            {
                _navigator.performLastSearch();
            };
        }

        private function headerProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                if (_arg_2.name == "header_button_close")
                {
                    visible = false;
                };
            };
        }

        private function createRoomProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _navigator.createRoom();
                if (_roomInfoPopup)
                {
                    _roomInfoPopup.show(false);
                };
            };
        }

        private function promoteRoomProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _navigator.context.createLinkEvent("catalog/open/room_ad");
                if (_roomInfoPopup)
                {
                    _roomInfoPopup.show(false);
                };
            };
        }

        private function randomRoomProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _navigator.context.createLinkEvent("navigator/goto/random_friending_room");
                if (_roomInfoPopup)
                {
                    _roomInfoPopup.show(false);
                };
                visible = false;
            };
        }

        private function leftPaneShowHideProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = _window.findChildByName("left_pane");
                setLeftPaneVisibility((!(_local_3.visible)));
                if (_roomInfoPopup)
                {
                    _roomInfoPopup.show(false);
                };
            };
        }

        public function setLeftPaneVisibility(_arg_1:Boolean):void
        {
            var _local_3:int;
            var _local_2:_SafeStr_3109 = _window.findChildByName("left_pane");
            var _local_5:int = ((_SafeStr_4481 - _leftPaneMargin) + 7);
            _SafeStr_4477.setParamFlag(0, true);
            _SafeStr_4477.setParamFlag(128, false);
            if (!_arg_1)
            {
                _local_2.visible = false;
                _SafeStr_4477.x = _SafeStr_4482;
                _window.limits.minWidth = ((_window.width - _local_5) + _SafeStr_4482);
                _window.limits.maxWidth = ((_window.width - _local_5) + _SafeStr_4482);
                _window.width = ((_window.width - _local_5) + _SafeStr_4482);
            }
            else
            {
                _local_2.visible = true;
                _SafeStr_4477.x = _SafeStr_4481;
                _local_3 = ((_window.width + _local_5) - _SafeStr_4482);
                _window.limits.minWidth = ((_local_3 > 578) ? 578 : _local_3);
                _window.limits.maxWidth = ((_local_3 > 578) ? 578 : _local_3);
                _window.width = ((_local_3 > 578) ? 578 : _local_3);
            };
            _SafeStr_4477.setParamFlag(0, false);
            _SafeStr_4477.setParamFlag(128, true);
            _window.findChildByName("left_hide_container").visible = _arg_1;
            _window.findChildByName("left_show_container").visible = (!(_arg_1));
            var _local_4:int = ((_arg_1) ? 115 : (115 - (_local_5 / 2)));
            _window.findChildByName("top_view_select_tab_context").x = _local_4;
        }

        private function keepWindowInsideScreenRegion():void
        {
            _window.x = Math.max(0, _window.x);
            _window.y = Math.max(0, _window.y);
            if (_window.desktop)
            {
                _window.x = Math.min((_window.desktop.width - _window.width), _window.x);
                _window.y = Math.min((_window.desktop.height - _window.height), _window.y);
            };
        }

        private function sendWindowPreferences():void
        {
            _SafeStr_4478 = _window.x;
            _SafeStr_4479 = _window.y;
            _lastWindowWidth = _window.width;
            _SafeStr_4480 = _window.height;
            _lastLeftPaneHidden = _window.findChildByName("left_pane").visible;
            _SafeStr_4483 = getTimer();
            _navigator.sendWindowPreferences(_SafeStr_4478, _SafeStr_4479, _lastWindowWidth, _SafeStr_4480, _lastLeftPaneHidden, 0);
            _navigator.trackEventLog("windowsettings", "Interface", ((_window.width + " x ") + _window.height));
        }

        private function get windowPreferencesChanged():Boolean
        {
            if (_lastLeftPaneHidden != _window.findChildByName("left_pane").visible)
            {
                return (true);
            };
            if (_SafeStr_4478 != _window.x)
            {
                return (true);
            };
            if (_SafeStr_4479 != _window.y)
            {
                return (true);
            };
            if (_SafeStr_4480 != _window.height)
            {
                return (true);
            };
            return (false);
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:uint = getTimer();
            if (((windowPreferencesChanged) && ((_local_2 - _SafeStr_4483) > 5000)))
            {
                sendWindowPreferences();
            };
            keepWindowInsideScreenRegion();
            _SafeStr_4484 = (_SafeStr_4484 - _arg_1);
            if (((isRoomInfoBubbleVisible) && (_SafeStr_4484 < 0)))
            {
                _roomInfoPopup.getGlobalRectangle(roomInfoGlobalRectangle);
                if (!roomInfoGlobalRectangle.contains(_window.desktop.mouseX, _window.desktop.mouseY))
                {
                    _roomInfoPopup.show(false);
                };
            };
        }

        public function dispose():void
        {
            _navigator.removeUpdateReceiver(this);
        }

        public function get disposed():Boolean
        {
            return (false);
        }

        public function onGroupDetailsArrived(_arg_1:int):void
        {
            if (_waitingForGroupDetails == _arg_1)
            {
                _waitingForGroupDetails = -1;
            };
        }

        public function get isRoomInfoBubbleVisible():Boolean
        {
            if (_roomInfoPopup)
            {
                return (_roomInfoPopup.visible);
            };
            return (false);
        }


    }
}//package com.sulake.habbo.navigator.view

// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1598 = "_-UP" (String#10470, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3197 = "_-fs" (String#4924, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4336 = "_-81f" (String#4202, DoABC#4)
// _SafeStr_4470 = "_-lM" (String#4241, DoABC#4)
// _SafeStr_4471 = "_-P1b" (String#4925, DoABC#4)
// _SafeStr_4472 = "_-32f" (String#8417, DoABC#4)
// _SafeStr_4473 = "_-Y1m" (String#15721, DoABC#4)
// _SafeStr_4474 = "_-w12" (String#2998, DoABC#4)
// _SafeStr_4475 = "_-kB" (String#9198, DoABC#4)
// _SafeStr_4476 = "_-6K" (String#22162, DoABC#4)
// _SafeStr_4477 = "_-12J" (String#3304, DoABC#4)
// _SafeStr_4478 = "_-6J" (String#3980, DoABC#4)
// _SafeStr_4479 = "_-V1z" (String#4062, DoABC#4)
// _SafeStr_4480 = "_-cJ" (String#3440, DoABC#4)
// _SafeStr_4481 = "_-t1D" (String#15251, DoABC#4)
// _SafeStr_4482 = "_-813" (String#9532, DoABC#4)
// _SafeStr_4483 = "_-02U" (String#10160, DoABC#4)
// _SafeStr_4484 = "_-VC" (String#11510, DoABC#4)
// _SafeStr_8668 = "_-W1w" (String#36603, DoABC#4)
// _SafeStr_8669 = "_-Fi" (String#39896, DoABC#4)
// _SafeStr_8670 = "_-e1Y" (String#23142, DoABC#4)
// _SafeStr_8671 = "_-dP" (String#23969, DoABC#4)
// _SafeStr_8672 = "_-b1x" (String#28160, DoABC#4)
// _SafeStr_8673 = "_-QD" (String#23211, DoABC#4)


