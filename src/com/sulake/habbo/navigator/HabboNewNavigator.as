// by nota

//com.sulake.habbo.navigator.HabboNewNavigator

package com.sulake.habbo.navigator
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.navigator.transitional.LegacyNavigator;
    import com.sulake.habbo.navigator.view.NavigatorView;
    import com.sulake.habbo.navigator.context.ContextContainer;
    import com.sulake.habbo.navigator.lift.LiftDataContainer;
    import com.sulake.habbo.navigator.context.SearchContextHistoryManager;
    import _-21f._SafeStr_3197;
    import com.sulake.core.utils._SafeStr_24;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.navigator.cache.NavigatorCache;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboNavigator;
    import _-kT._SafeStr_927;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import _-Tr._SafeStr_1073;
    import com.sulake.habbo.navigator.context.SearchContext;
    import _-21f._SafeStr_1663;
    import _-Ja._SafeStr_1569;
    import _-21f._SafeStr_1547;
    import _-Tr._SafeStr_1430;
    import _-Tr._SafeStr_1238;
    import _-21f._SafeStr_1598;
    import _-Tr._SafeStr_1182;
    import _-W1K._SafeStr_1123;
    import _-kT._SafeStr_846;
    import _-kT._SafeStr_175;
    import _-kT._SafeStr_220;
    import com.sulake.habbo.session.events.PerksUpdatedEvent;
    import _-M1k._SafeStr_372;
    import com.sulake.habbo.utils.Base64;
    import flash.geom.Point;
    import _-M1k._SafeStr_525;
    import _-XO._SafeStr_313;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import _-71W._SafeStr_416;
    import _-XO._SafeStr_197;
    import _-kT._SafeStr_649;
    import _-kT._SafeStr_963;
    import _-kT._SafeStr_964;

    public class HabboNewNavigator extends Component implements IHabboNewNavigator, ILinkEventTracker 
    {

        private var _communication:IHabboCommunicationManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _windowManager:_SafeStr_1695;
        private var _localization:_SafeStr_18;
        private var _sessionData:ISessionDataManager;
        private var _tracking:_SafeStr_1704;
        private var _catalog:IHabboCatalog;
        private var _habboHelp:IHabboHelp;
        private var _avatarManager:_SafeStr_1701;
        private var _SafeStr_3757:_SafeStr_3205;
        private var _toolbar:IHabboToolbar;
        private var _SafeStr_3964:HabboNavigator;
        private var _SafeStr_3965:LegacyNavigator;
        private var _SafeStr_3853:Boolean = false;
        private var _SafeStr_3968:NavigatorView;
        private var _SafeStr_3966:ContextContainer;
        private var _SafeStr_3972:LiftDataContainer;
        private var _SafeStr_3967:SearchContextHistoryManager;
        private var _currentResults:_SafeStr_3197;
        private var _groupDetails:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_3970:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_3973:Vector.<String> = new Vector.<String>(0);
        private var _navigatorCache:NavigatorCache;
        private var _SafeStr_3974:String = "official_view";
        private var _SafeStr_3975:String = "";
        private var _SafeStr_3969:String = "";
        private var _SafeStr_3971:Boolean = false;
        private var _noPushToHistoryDueToNavigation:Boolean = false;

        public function HabboNewNavigator(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_3965 = new LegacyNavigator(this, _SafeStr_3964);
        }

        public static function getEventLogExtraStringFromSearch(_arg_1:String, _arg_2:String):String
        {
            return (_arg_1 + ((_arg_2 == "") ? "" : (":" + _arg_2)));
        }


        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get communication():IHabboCommunicationManager
        {
            return (_communication);
        }

        public function get sessionData():ISessionDataManager
        {
            return (_sessionData);
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return (_roomSessionManager);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communication = _arg_1;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (_arg_1:IRoomSessionManager):void
            {
                _roomSessionManager = _arg_1;
            }), new ComponentDependency(new IIDHabboToolbar(), function (_arg_1:IHabboToolbar):void
            {
                _toolbar = _arg_1;
            }, false, [{
                "type":"HTE_TOOLBAR_CLICK",
                "callback":onHabboToolbarEvent
            }]), new ComponentDependency(new IIDHabboCatalog(), function (_arg_1:IHabboCatalog):void
            {
                _catalog = _arg_1;
            }, false), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionData = _arg_1;
            }, true, [{
                "type":"PUE_perks_updated",
                "callback":onPerksUpdated
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboTracking(), function (_arg_1:_SafeStr_1704):void
            {
                _tracking = _arg_1;
            }), new ComponentDependency(new IIDAvatarRenderManager(), function (_arg_1:_SafeStr_1701):void
            {
                _avatarManager = _arg_1;
            }), new ComponentDependency(new IIDHabboHelp(), function (_arg_1:IHabboHelp):void
            {
                _habboHelp = _arg_1;
            }, false), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            }), new ComponentDependency(new IIDHabboNavigator(), function (_arg_1:_SafeStr_1696):void
            {
                _SafeStr_3964 = HabboNavigator(_arg_1);
                if (_SafeStr_3965)
                {
                    _SafeStr_3965.oldNavigator = _SafeStr_3964;
                };
            }, true)]));
        }

        override protected function initComponent():void
        {
            _SafeStr_3757 = new _SafeStr_3205(this);
            context.addLinkEventTracker(this);
            _SafeStr_3968 = new NavigatorView(this);
            _SafeStr_3966 = new ContextContainer(this);
            _SafeStr_3967 = new SearchContextHistoryManager(this);
            _SafeStr_3972 = new LiftDataContainer(this);
            _navigatorCache = new NavigatorCache();
            _communication.connection.send(new _SafeStr_927());
            _SafeStr_3853 = true;
        }

        private function onHabboToolbarEvent(_arg_1:HabboToolbarEvent):void
        {
            if (_arg_1.type == "HTE_TOOLBAR_CLICK")
            {
                switch (_arg_1.iconId)
                {
                    case "HTIE_ICON_NAVIGATOR":
                        toggle();
                        return;
                };
            };
        }

        public function initialize(_arg_1:_SafeStr_1073):void
        {
            _SafeStr_3966.initialize(_arg_1);
        }

        public function onSearchResult(_arg_1:_SafeStr_3197):void
        {
            _SafeStr_3971 = false;
            _currentResults = _arg_1;
            extractRoomNamesFromResults(_arg_1.resultSet);
            if (!_noPushToHistoryDueToNavigation)
            {
                _SafeStr_3967.addSearchContextAtCurrentOffset(new SearchContext(_arg_1.searchCodeOriginal, _arg_1.filteringData));
            };
            _navigatorCache.put(((_arg_1.searchCodeOriginal + "/") + _arg_1.filteringData), _arg_1);
            _noPushToHistoryDueToNavigation = false;
            if (_SafeStr_3968.visible)
            {
                _SafeStr_3968.onSearchResults(_arg_1, _SafeStr_3969);
            };
        }

        private function extractRoomNamesFromResults(_arg_1:_SafeStr_1547):void
        {
            _SafeStr_3970 = new _SafeStr_24();
            for each (var _local_2:_SafeStr_1663 in _arg_1.blocks)
            {
                for each (var _local_3:_SafeStr_1569 in _local_2.guestRooms)
                {
                    _SafeStr_3970.add(_local_3.flatId, _local_3.roomName);
                };
            };
        }

        public function get newResultsRendered():Boolean
        {
            return (_SafeStr_3971);
        }

        public function set newResultsRendered(_arg_1:Boolean):void
        {
            _SafeStr_3971 = _arg_1;
        }

        public function onLiftedRooms(_arg_1:_SafeStr_1430):void
        {
            _SafeStr_3972.setLiftedRooms(_arg_1.liftedRooms);
            _SafeStr_3968.refreshLiftedRooms();
        }

        public function onPreferences(_arg_1:_SafeStr_1238):void
        {
            _SafeStr_3968.setInitialWindowDimensions(_arg_1.windowX, _arg_1.windowY, _arg_1.windowHeight, _arg_1.leftPaneHidden, _arg_1.resultsMode);
        }

        public function onSavedSearches(_arg_1:_SafeStr_1182):void
        {
            _SafeStr_3966.savedSearches = _arg_1.savedSearches.concat(new Vector.<_SafeStr_1598>(0));
            _SafeStr_3968.onSavedSearches(_SafeStr_3966.savedSearches);
        }

        public function onGroupDetails(_arg_1:_SafeStr_1123):void
        {
            if (_groupDetails.hasKey(_arg_1.groupId))
            {
                _groupDetails.remove(_arg_1.groupId);
            };
            _groupDetails.add(_arg_1.groupId, _arg_1);
            _SafeStr_3968.onGroupDetailsArrived(_arg_1.groupId);
        }

        public function onCollapsedCategories(_arg_1:Vector.<String>):void
        {
            _SafeStr_3973 = _arg_1.concat();
        }

        public function get collapsedCategories():Vector.<String>
        {
            return (_SafeStr_3973);
        }

        public function getCachedGroupDetails(_arg_1:int):_SafeStr_1123
        {
            return (_groupDetails.getValue(_arg_1));
        }

        public function goBack():void
        {
            if (_SafeStr_3967.hasPrevious)
            {
                _noPushToHistoryDueToNavigation = true;
                performSearchByContext(_SafeStr_3967.getPreviousSearchContextAndGoBack());
            };
            trackEventLog("browse.back", "Results");
        }

        public function performLastSearch():void
        {
            if (((!(_SafeStr_3974 == null)) && (!(_SafeStr_3975 == null))))
            {
                _navigatorCache.removeEntry(((_SafeStr_3974 + "/") + _SafeStr_3975));
                performSearch(_SafeStr_3974, _SafeStr_3975);
            };
        }

        public function performSearch(_arg_1:String, _arg_2:String="", _arg_3:String=""):void
        {
            _SafeStr_3968.isBusy = true;
            _SafeStr_3969 = _arg_3;
            var _local_4:_SafeStr_3197 = _navigatorCache.getEntry(((_arg_1 + "/") + _arg_2));
            if (_local_4 != null)
            {
                onSearchResult(_local_4);
            }
            else
            {
                _SafeStr_3974 = _arg_1;
                _SafeStr_3975 = _arg_2;
                _communication.connection.send(new _SafeStr_846(_arg_1, _arg_2));
                trackEventLog("search", "Search", getEventLogExtraStringFromSearch(_arg_1, _arg_2));
            };
            open();
        }

        public function performSearchByContext(_arg_1:SearchContext):void
        {
            performSearch(_arg_1.searchCode, _arg_1.filtering);
        }

        public function addSavedSearch(_arg_1:String, _arg_2:String):void
        {
            if (_currentResults != null)
            {
                _communication.connection.send(new _SafeStr_175(_arg_1, _arg_2));
            };
            trackEventLog("savedsearch.add", "SavedSearch", getEventLogExtraStringFromSearch(_arg_1, _arg_2));
            _SafeStr_3968.setLeftPaneVisibility(true);
        }

        public function deleteSavedSearch(_arg_1:int):void
        {
            _communication.connection.send(new _SafeStr_220(_arg_1));
            trackEventLog("savedsearch.delete", "SavedSearch");
        }

        private function onPerksUpdated(_arg_1:PerksUpdatedEvent):void
        {
            if (!_sessionData.isPerkAllowed("NAVIGATOR_PHASE_TWO_2014"))
            {
                context.removeLinkEventTracker(this);
                if (_SafeStr_3853)
                {
                    _SafeStr_3757.removeLegacyMessageListeners();
                    close();
                };
                return;
            };
            if (!_SafeStr_3853)
            {
                initComponent();
            }
            else
            {
                if (_sessionData.isPerkAllowed("NAVIGATOR_PHASE_TWO_2014"))
                {
                    _SafeStr_3757.addMessageListeners();
                };
            };
        }

        public function get linkPattern():String
        {
            return ("navigator/");
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_3:int;
            var _local_2:Array = _arg_1.split("/");
            if (_local_2.length < 2)
            {
                return;
            };
            switch (_local_2[1])
            {
                case "goto":
                    if (_local_2.length > 2)
                    {
                        switch (_local_2[2])
                        {
                            case "home":
                                _SafeStr_3965.goToHomeRoom();
                                break;
                            default:
                                _local_3 = _local_2[2];
                                if (_local_3 > 0)
                                {
                                    _SafeStr_3965.goToPrivateRoom(_local_3);
                                }
                                else
                                {
                                    communication.connection.send(new _SafeStr_372(_local_2[2]));
                                };
                        };
                    };
                    return;
                case "search":
                    if (_local_2.length > 2)
                    {
                        performSearch("hotel_view", _local_2[2]);
                    };
                    return;
                case "tag":
                    if (_local_2.length > 2)
                    {
                        performSearch("hotel_view", _local_2[2]);
                    };
                    return;
                case "tab":
                    if (_local_2.length > 2)
                    {
                        performSearch(_local_2[2]);
                    };
                    return;
                case "report":
                    if (_local_2.length > 3)
                    {
                        _SafeStr_3965.reportRoomFromWeb(_local_2[2], Base64.decode(_local_2[3]));
                    };
                    return;
                default:
                    _SafeStr_14.log(("Navigator unknown link-type received: " + _local_2[1]));
                    return;
            };
        }

        public function showOwnRooms():void
        {
        }

        public function showToolbarHover(_arg_1:Point):void
        {
        }

        public function hideToolbarHover(_arg_1:Boolean):void
        {
        }

        public function get isReady():Boolean
        {
            return ((!(_SafeStr_3966 == null)) && (_SafeStr_3966.isReady()));
        }

        public function get contextContainer():ContextContainer
        {
            return (_SafeStr_3966);
        }

        public function get searchContextHistoryManager():SearchContextHistoryManager
        {
            return (_SafeStr_3967);
        }

        public function get liftDataContainer():LiftDataContainer
        {
            return (_SafeStr_3972);
        }

        public function get currentResults():_SafeStr_3197
        {
            return (_currentResults);
        }

        public function goToRoom(_arg_1:int, _arg_2:String="mainview"):void
        {
            communication.connection.send(new _SafeStr_525(_arg_1, false, true));
            _SafeStr_3968.visible = false;
            var _local_3:String = _SafeStr_3970.getValue(_arg_1);
            trackEventLog("go", _arg_2, ((_local_3) ? _local_3 : ""), _arg_1);
        }

        public function getExtendedProfile(_arg_1:int):void
        {
            communication.connection.send(new _SafeStr_313(_arg_1));
        }

        public function get imageLibraryBaseUrl():String
        {
            return (context.configuration.getProperty("image.library.url"));
        }

        public function performTagSearch(_arg_1:String):void
        {
            performSearch("hotel_view", ("tag:" + _arg_1));
        }

        public function createRoom():void
        {
            _SafeStr_3965.roomCreateViewCtrl.show();
        }

        public function open():void
        {
            if (_SafeStr_3968 == null)
            {
                return;
            };
            if (!_SafeStr_3968.visible)
            {
                _SafeStr_3968.visible = true;
            };
        }

        public function close():void
        {
            if (_SafeStr_3968.visible)
            {
                _SafeStr_3968.visible = false;
            };
        }

        public function toggle():void
        {
            if (_SafeStr_3968 == null)
            {
                return;
            };
            _SafeStr_3968.visible = (!(_SafeStr_3968.visible));
            if (_SafeStr_3968.visible)
            {
                performLastSearch();
            };
        }

        public function get mainWindow():_SafeStr_3263
        {
            return (_SafeStr_3968.mainWindow);
        }

        public function refresh():void
        {
            if (_currentResults)
            {
                _SafeStr_3968.onSearchResults(_currentResults);
            };
        }

        public function get legacyNavigator():_SafeStr_1696
        {
            return (_SafeStr_3965);
        }

        public function get data():NavigatorData
        {
            return (_SafeStr_3965.data);
        }

        public function sendWindowPreferences(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:int):void
        {
            _communication.connection.send(new _SafeStr_416(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6));
        }

        public function getGuildInfo(_arg_1:int, _arg_2:Boolean=true):void
        {
            _communication.connection.send(new _SafeStr_197(_arg_1, _arg_2));
        }

        public function sendAddCollapsedCategory(_arg_1:String):void
        {
            _communication.connection.send(new _SafeStr_649(_arg_1));
        }

        public function sendRemoveCollapsedCategory(_arg_1:String):void
        {
            _communication.connection.send(new _SafeStr_963(_arg_1));
        }

        public function goToHomeRoom():void
        {
            goToRoom(_SafeStr_3965.data.homeRoomId, "external");
        }

        public function trackEventLog(_arg_1:String, _arg_2:String, _arg_3:String="", _arg_4:int=0):void
        {
            if (_tracking)
            {
                _tracking.trackEventLog("NewNavigator", _arg_2, _arg_1, _arg_3, _arg_4);
            };
        }

        public function get view():NavigatorView
        {
            return (_SafeStr_3968);
        }

        public function toggleSearchCodeViewMode(_arg_1:String, _arg_2:int):void
        {
            _communication.connection.send(new _SafeStr_964(_arg_1, _arg_2));
            trackEventLog("browse.toggleviewmode", "ViewMode", "", _arg_2);
        }

        public function get habboHelp():IHabboHelp
        {
            return (_habboHelp);
        }

        public function performTextSearch(_arg_1:String):void
        {
        }

        public function performGuildBaseSearch():void
        {
        }

        public function performCompetitionRoomsSearch(_arg_1:int, _arg_2:int):void
        {
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_1073 = "_-b14" (String#28772, DoABC#4)
// _SafeStr_1123 = "_-r1M" (String#6272, DoABC#4)
// _SafeStr_1182 = "_-Gn" (String#39912, DoABC#4)
// _SafeStr_1238 = "_-c1X" (String#37614, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1430 = "_-ZN" (String#31913, DoABC#4)
// _SafeStr_1547 = "_-E1O" (String#12956, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1598 = "_-UP" (String#10470, DoABC#4)
// _SafeStr_1663 = "_-l1U" (String#23689, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_175 = "_-lJ" (String#28398, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_197 = "_-G1o" (String#2651, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_220 = "_-C1j" (String#28886, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3197 = "_-fs" (String#4924, DoABC#4)
// _SafeStr_3205 = "_-ND" (String#13641, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_372 = "_-N1R" (String#21312, DoABC#4)
// _SafeStr_3757 = "_-iH" (String#1838, DoABC#4)
// _SafeStr_3853 = "_-T1w" (String#2104, DoABC#4)
// _SafeStr_3964 = "_-5U" (String#1522, DoABC#4)
// _SafeStr_3965 = "_-MN" (String#6312, DoABC#4)
// _SafeStr_3966 = "_-02O" (String#7957, DoABC#4)
// _SafeStr_3967 = "_-x1w" (String#10844, DoABC#4)
// _SafeStr_3968 = "_-4S" (String#3314, DoABC#4)
// _SafeStr_3969 = "_-l1l" (String#21513, DoABC#4)
// _SafeStr_3970 = "_-gG" (String#11079, DoABC#4)
// _SafeStr_3971 = "_-YC" (String#11954, DoABC#4)
// _SafeStr_3972 = "_-q19" (String#14824, DoABC#4)
// _SafeStr_3973 = "_-LU" (String#13475, DoABC#4)
// _SafeStr_3974 = "_-918" (String#11843, DoABC#4)
// _SafeStr_3975 = "_-Q1q" (String#12139, DoABC#4)
// _SafeStr_416 = "_-VN" (String#29720, DoABC#4)
// _SafeStr_525 = "_-c1I" (String#3620, DoABC#4)
// _SafeStr_649 = "_-W1T" (String#31490, DoABC#4)
// _SafeStr_846 = "_-L1i" (String#29335, DoABC#4)
// _SafeStr_927 = "_-Fz" (String#30658, DoABC#4)
// _SafeStr_963 = "_-vA" (String#31215, DoABC#4)
// _SafeStr_964 = "_-w1g" (String#30308, DoABC#4)


