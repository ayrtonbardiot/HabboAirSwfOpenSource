// by nota

//com.sulake.habbo.navigator.HabboNavigator

package com.sulake.habbo.navigator
{
    import com.sulake.core.runtime._SafeStr_20;
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
    import com.sulake.habbo.navigator.mainview.MainViewCtrl;
    import com.sulake.habbo.navigator.inroom.RoomInfoViewCtrl;
    import com.sulake.habbo.navigator.roomsettings.RoomCreateViewCtrl;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
    import com.sulake.habbo.navigator.mainview.OfficialRoomEntryManager;
    import com.sulake.habbo.navigator.inroom.RoomEventViewCtrl;
    import com.sulake.habbo.navigator.inroom.RoomEventInfoCtrl;
    import com.sulake.habbo.navigator.roomsettings.RoomFilterCtrl;
    import com.sulake.habbo.navigator.toolbar.ToolbarHoverCtrl;
    import com.sulake.habbo.navigator.roomsettings.EnforceCategoryCtrl;
    import com.sulake.core.assets.AssetLibraryCollection;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.habbo.navigator.mainview.ITransitionalMainViewCtrl;
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
    import __AS3__.vec.Vector;
    import flash.external.ExternalInterface;
    import _-M1k._SafeStr_119;
    import _-M1k._SafeStr_525;
    import _-M1k._SafeStr_500;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.utils.ErrorReportStorage;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import _-Ja._SafeStr_1559;
    import flash.geom.Point;
    import _-Ja._SafeStr_1569;
    import _-M1k._SafeStr_372;
    import com.sulake.habbo.session.events.PerksUpdatedEvent;
    import com.sulake.habbo.navigator.inroom.*;

    public class HabboNavigator extends _SafeStr_20 implements _SafeStr_1696, _SafeStr_1697, ILinkEventTracker 
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
        private var _SafeStr_3741:MainViewCtrl;
        private var _SafeStr_3743:RoomInfoViewCtrl;
        private var _SafeStr_3744:RoomCreateViewCtrl;
        private var _SafeStr_3740:NavigatorData;
        private var _SafeStr_3742:Tabs;
        private var _SafeStr_3745:_SafeStr_21;
        private var _SafeStr_3757:_SafeStr_3118;
        private var _toolbar:IHabboToolbar;
        private var _SafeStr_3746:RoomSettingsCtrl;
        private var _passwordInput:GuestRoomPasswordInput;
        private var _SafeStr_3747:GuestRoomDoorbell;
        private var _officialRoomEntryManager:OfficialRoomEntryManager;
        private var _SafeStr_3748:RoomEventViewCtrl;
        private var _SafeStr_3749:RoomEventInfoCtrl;
        private var _SafeStr_3750:RoomFilterCtrl;
        private var _toolbarHover:ToolbarHoverCtrl;
        private var _SafeStr_3751:EnforceCategoryCtrl;
        private var _SafeStr_3752:Boolean = true;
        private var _webRoomReportedName:String = null;

        public function HabboNavigator(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_3745 = new AssetLibraryCollection("NavigatorComponent");
            _SafeStr_3740 = new NavigatorData(this);
            _SafeStr_3741 = new MainViewCtrl(this);
            _SafeStr_3743 = new RoomInfoViewCtrl(this);
            _SafeStr_3744 = new RoomCreateViewCtrl(this);
            _passwordInput = new GuestRoomPasswordInput(this);
            _SafeStr_3747 = new GuestRoomDoorbell(this);
            _SafeStr_3742 = new Tabs(this);
            _officialRoomEntryManager = new OfficialRoomEntryManager(this);
            _SafeStr_3748 = new RoomEventViewCtrl(this);
            _SafeStr_3749 = new RoomEventInfoCtrl(this);
            _SafeStr_3750 = new RoomFilterCtrl(this);
            _SafeStr_3751 = new EnforceCategoryCtrl(this);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get data():NavigatorData
        {
            return (_SafeStr_3740);
        }

        public function get mainViewCtrl():ITransitionalMainViewCtrl
        {
            return (_SafeStr_3741);
        }

        public function get tabs():Tabs
        {
            return (_SafeStr_3742);
        }

        public function get roomInfoViewCtrl():RoomInfoViewCtrl
        {
            return (_SafeStr_3743);
        }

        public function get roomCreateViewCtrl():RoomCreateViewCtrl
        {
            return (_SafeStr_3744);
        }

        public function get assetLibrary():_SafeStr_21
        {
            return (_SafeStr_3745);
        }

        public function get communication():IHabboCommunicationManager
        {
            return (_communication);
        }

        public function get roomSettingsCtrl():RoomSettingsCtrl
        {
            return (_SafeStr_3746);
        }

        public function get sessionData():ISessionDataManager
        {
            return (_sessionData);
        }

        public function get passwordInput():GuestRoomPasswordInput
        {
            return (_passwordInput);
        }

        public function get doorbell():GuestRoomDoorbell
        {
            return (_SafeStr_3747);
        }

        public function get roomEventViewCtrl():RoomEventViewCtrl
        {
            return (_SafeStr_3748);
        }

        public function get officialRoomEntryManager():OfficialRoomEntryManager
        {
            return (_officialRoomEntryManager);
        }

        public function get toolbar():IHabboToolbar
        {
            return (_toolbar);
        }

        public function get habboHelp():IHabboHelp
        {
            return (_habboHelp);
        }

        public function get roomEventInfoCtrl():RoomEventInfoCtrl
        {
            return (_SafeStr_3749);
        }

        public function get roomFilterCtrl():RoomFilterCtrl
        {
            return (_SafeStr_3750);
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return (_roomSessionManager);
        }

        public function get enforceCategoryCtrl():EnforceCategoryCtrl
        {
            return (_SafeStr_3751);
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
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            _SafeStr_3757 = new _SafeStr_3118(this);
            _roomSessionManager.events.addEventListener("RSE_CREATED", onRoomSessionCreatedEvent);
            if (!_sessionData.isPerkAllowed("NAVIGATOR_PHASE_TWO_2014"))
            {
                context.addLinkEventTracker(this);
            };
            var _local_1:String = getProperty("navigator.default_tab");
            if (getInteger("new.identity", 0) > 0)
            {
                _local_1 = getProperty("new.identity.navigator.default_tab");
            };
            tabs.setSelectedTab(Tabs.tabIdFromName(_local_1, 2));
            _SafeStr_3746 = new RoomSettingsCtrl(this);
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback("openroom", enterRoomWebRequest);
            };
        }

        public function enterRoomWebRequest(_arg_1:String, _arg_2:Boolean=false, _arg_3:String=null):void
        {
            _SafeStr_3752 = _arg_2;
            _webRoomReportedName = _arg_3;
            send(new _SafeStr_119(_arg_1));
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_3741)
            {
                _SafeStr_3741.dispose();
                _SafeStr_3741 = null;
            };
            if (_roomSessionManager != null)
            {
                _roomSessionManager.events.removeEventListener("RSE_CREATED", onRoomSessionCreatedEvent);
            };
            context.removeLinkEventTracker(this);
            if (((!(_toolbar == null)) && (!(_toolbar.events == null))))
            {
                _toolbar.events.removeEventListener("HTE_TOOLBAR_CLICK", onHabboToolbarEvent);
            };
            if (_SafeStr_3743)
            {
                _SafeStr_3743.dispose();
                _SafeStr_3743 = null;
            };
            if (_SafeStr_3750)
            {
                _SafeStr_3750.dispose();
                _SafeStr_3750 = null;
            };
            if (_SafeStr_3744)
            {
                _SafeStr_3744.dispose();
                _SafeStr_3744 = null;
            };
            if (_officialRoomEntryManager)
            {
                _officialRoomEntryManager.dispose();
                _officialRoomEntryManager = null;
            };
            if (_SafeStr_3748)
            {
                _SafeStr_3748.dispose();
                _SafeStr_3748 = null;
            };
            if (_SafeStr_3746)
            {
                _SafeStr_3746.dispose();
                _SafeStr_3746 = null;
            };
            if (_toolbarHover)
            {
                _toolbarHover.dispose();
                _toolbarHover = null;
            };
            super.dispose();
        }

        public function startRoomCreation():void
        {
            _SafeStr_3744.show();
        }

        public function goToPrivateRoom(_arg_1:int):void
        {
            send(new _SafeStr_525(_arg_1, false, true));
        }

        public function removeRoomRights(_arg_1:int):void
        {
            send(new _SafeStr_500(_arg_1));
        }

        public function hasRoomRightsButIsNotOwner(_arg_1:int):Boolean
        {
            var _local_2:* = null;
            if (_roomSessionManager)
            {
                _local_2 = _roomSessionManager.getSession(_arg_1);
                return ((_local_2.roomControllerLevel == 1) && (!(_local_2.isRoomOwner)));
            };
            return (false);
        }

        public function goToRoomNetwork(_arg_1:int, _arg_2:Boolean):void
        {
            var _local_3:int;
            if (_roomSessionManager)
            {
                _SafeStr_3743.close();
                _local_3 = 0;
                if (((_arg_2) && (_SafeStr_3740.homeRoomId > 0)))
                {
                    _local_3 = _SafeStr_3740.homeRoomId;
                };
                _roomSessionManager.gotoRoomNetwork(_arg_1, _local_3);
            };
        }

        public function goToRoom(_arg_1:int, _arg_2:Boolean, _arg_3:String="", _arg_4:int=-1):void
        {
            var _local_5:int;
            if (_roomSessionManager)
            {
                _SafeStr_14.log(("[HabboNavigator] Go to room: " + _arg_1));
                if (_arg_2)
                {
                    _SafeStr_3741.close();
                };
                _roomSessionManager.gotoRoom(_arg_1, _arg_3);
                if (tabs.getSelected())
                {
                    _local_5 = ((_arg_4 > -1) ? (_arg_4 + 1) : 0);
                    switch (tabs.getSelected().id)
                    {
                        case 4:
                            trackNavigationDataPoint(tabs.getSelected().tabPageDecorator.filterCategory, "go.official", String(_arg_1), _local_5);
                            break;
                        case 3:
                            trackNavigationDataPoint(tabs.getSelected().tabPageDecorator.filterCategory, "go.me", String(_arg_1), _local_5);
                            break;
                        case 2:
                            trackNavigationDataPoint(tabs.getSelected().tabPageDecorator.filterCategory, "go.rooms", String(_arg_1), _local_5);
                            break;
                        case 1:
                            trackNavigationDataPoint("Events", "go.events", String(_arg_1), _local_5);
                            break;
                        case 5:
                            trackNavigationDataPoint("Search", "go.search", String(_arg_1), _local_5);
                        default:
                    };
                };
            }
            else
            {
                _SafeStr_14.log(("[HabboNavigator] Room Session Manager is not initialized. Can not enter: " + _arg_1));
            };
        }

        public function goToHomeRoom():Boolean
        {
            if (this._SafeStr_3740.homeRoomId < 1)
            {
                _SafeStr_14.log("No home room set while attempting to go to home room");
                return (false);
            };
            this.goToRoom(this._SafeStr_3740.homeRoomId, true);
            return (true);
        }

        public function send(_arg_1:IMessageComposer, _arg_2:Boolean=false):void
        {
            _communication.connection.send(_arg_1);
        }

        public function getXmlWindow(_arg_1:String, _arg_2:uint=1):_SafeStr_3109
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:_SafeStr_3109;
            try
            {
                _local_5 = assets.getAssetByName((_arg_1 + "_xml"));
                _local_3 = XmlAsset(_local_5);
                _local_4 = _windowManager.buildFromXML(XML(_local_3.content), _arg_2);
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboNavigator", (((((("Failed to build window " + _arg_1) + "_xml, ") + _local_5) + ", ") + _windowManager) + "!"));
                throw (e);
            };
            return (_local_4);
        }

        public function getText(_arg_1:String):String
        {
            var _local_2:String = _localization.getLocalization(_arg_1);
            if (((_local_2 == null) || (_local_2 == "")))
            {
                _local_2 = _arg_1;
            };
            return (_local_2);
        }

        public function registerParameter(_arg_1:String, _arg_2:String, _arg_3:String):String
        {
            return (_localization.registerParameter(_arg_1, _arg_2, _arg_3));
        }

        public function getButton(_arg_1:String, _arg_2:String, _arg_3:Function, _arg_4:int=0, _arg_5:int=0, _arg_6:int=0):_SafeStr_3264
        {
            var _local_8:BitmapData = getButtonImage(_arg_2);
            var _local_7:_SafeStr_3264 = _SafeStr_3264(_windowManager.createWindow(_arg_1, "", 21, 0, (0x01 | 0x10), new Rectangle(_arg_4, _arg_5, _local_8.width, _local_8.height), _arg_3, _arg_6));
            _local_7.bitmap = _local_8;
            _local_7.disposesBitmap = false;
            return (_local_7);
        }

        public function refreshButton(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Boolean, _arg_4:Function, _arg_5:int, _arg_6:String=null):void
        {
            if (!_arg_6)
            {
                _arg_6 = _arg_2;
            };
            var _local_7:_SafeStr_3264 = (_arg_1.findChildByName(_arg_2) as _SafeStr_3264);
            if (!_local_7)
            {
                _SafeStr_14.log(("Could not locate button in navigator: " + _arg_2));
            };
            if (!_arg_3)
            {
                _local_7.visible = false;
            }
            else
            {
                prepareButton(_local_7, _arg_6, _arg_4, _arg_5);
                _local_7.visible = true;
            };
        }

        private function prepareButton(_arg_1:_SafeStr_3264, _arg_2:String, _arg_3:Function, _arg_4:int):void
        {
            _arg_1.id = _arg_4;
            _arg_1.procedure = _arg_3;
            if (_arg_1.bitmap != null)
            {
                return;
            };
            _arg_1.bitmap = getButtonImage(_arg_2);
            _arg_1.disposesBitmap = false;
            _arg_1.width = _arg_1.bitmap.width;
            _arg_1.height = _arg_1.bitmap.height;
        }

        public function getButtonImage(_arg_1:String, _arg_2:String="_png"):BitmapData
        {
            var _local_6:* = null;
            var _local_4:String = (_arg_1 + _arg_2);
            var _local_7:IAsset = assets.getAssetByName(_local_4);
            var _local_5:BitmapDataAsset = BitmapDataAsset(_local_7);
            return (BitmapData(_local_5.content));
        }

        private function onRoomSessionCreatedEvent(_arg_1:RoomSessionEvent):void
        {
            if (((_roomSessionManager) && (_SafeStr_3743)))
            {
                _SafeStr_3743.close();
            };
        }

        public function openCatalogClubPage(_arg_1:String):void
        {
            if (_catalog == null)
            {
                return;
            };
            _catalog.openClubCenter();
        }

        public function openCatalogRoomAdsPage():void
        {
            if (_catalog == null)
            {
                return;
            };
            _catalog.openCatalogPage("room_ad");
        }

        public function openCatalogRoomAdsExtendPage(_arg_1:String, _arg_2:String, _arg_3:Date, _arg_4:int):void
        {
            if (_catalog == null)
            {
                return;
            };
            var _local_5:String = _SafeStr_3740.enteredGuestRoom.roomName;
            _catalog.openRoomAdCatalogPageInExtendedMode("room_ad", _arg_1, _arg_2, _local_5, _arg_3, _arg_4);
        }

        private function onHabboToolbarEvent(_arg_1:HabboToolbarEvent):void
        {
            if (_arg_1.type == "HTE_TOOLBAR_CLICK")
            {
                switch (_arg_1.iconId)
                {
                    case "HTIE_ICON_ROOMINFO":
                        toggleRoomInfoVisibility();
                        return;
                    case "HTIE_ICON_NAVIGATOR_ME_TAB":
                        showOwnRooms();
                        return;
                    case "HTIE_ICON_GAMES":
                        if (getBoolean("game.center.enabled"))
                        {
                            closeNavigator();
                        };
                        return;
                    case "HTIE_ICON_HOME":
                        goToHomeRoom();
                        return;
                };
            };
        }

        public function toggleRoomInfoVisibility():void
        {
            if (_SafeStr_3744)
            {
                _SafeStr_3743.toggle();
            };
        }

        public function performTagSearch(_arg_1:String):void
        {
            if (_SafeStr_3741 == null)
            {
                return;
            };
            if (_arg_1.indexOf(" ") != -1)
            {
                _arg_1 = (('"' + _arg_1) + '"');
            };
            _SafeStr_3741.startSearch(5, 9, _arg_1);
            trackNavigationDataPoint("Search", "search.tag", _arg_1);
            _SafeStr_3741.mainWindow.activate();
        }

        public function performTextSearch(_arg_1:String):void
        {
            if (_SafeStr_3741 == null)
            {
                return;
            };
            _SafeStr_3741.startSearch(5, 8, _arg_1);
            trackNavigationDataPoint("Search", "search", _arg_1);
            _SafeStr_3741.mainWindow.activate();
            _SafeStr_3741.searchInput.searchStr.setText(_arg_1);
        }

        public function performCompetitionRoomsSearch(_arg_1:int, _arg_2:int):void
        {
            if (((_SafeStr_3741 == null) || ((!(_SafeStr_3740 == null)) && (_SafeStr_3740.isLoading()))))
            {
                return;
            };
            _SafeStr_3740.competitionRoomsData = new _SafeStr_1559(null, _arg_1, _arg_2);
            _SafeStr_3741.startSearch(5, 15, "");
            _SafeStr_3741.mainWindow.activate();
            _SafeStr_3741.searchInput.searchStr.setText("");
        }

        public function performGuildBaseSearch():void
        {
            if (_SafeStr_3741 == null)
            {
                return;
            };
            _SafeStr_3741.startSearch(5, 14, "");
            _SafeStr_3741.mainWindow.activate();
            _SafeStr_3741.searchInput.searchStr.setText("");
        }

        public function showOwnRooms():void
        {
            if (_SafeStr_3741 == null)
            {
                return;
            };
            _SafeStr_3741.startSearch(3, 5);
            _SafeStr_3742.getTab(3).tabPageDecorator.tabSelected();
        }

        public function showFavouriteRooms():void
        {
            showMeTab(6);
        }

        public function showHistoryRooms():void
        {
            showMeTab(7);
        }

        public function showFrequentRooms():void
        {
            showMeTab(23);
        }

        private function showMeTab(_arg_1:int):void
        {
            if (_SafeStr_3741 == null)
            {
                return;
            };
            _SafeStr_3741.startSearch(3, _arg_1);
            _SafeStr_3742.getTab(3).tabPageDecorator.setSubSelection(_arg_1);
        }

        public function trackNavigationDataPoint(_arg_1:String, _arg_2:String, _arg_3:String="", _arg_4:int=0):void
        {
            if (_tracking)
            {
                _tracking.trackEventLog("Navigation", _arg_1, _arg_2, _arg_3, _arg_4);
            };
        }

        public function trackGoogle(_arg_1:String, _arg_2:String, _arg_3:int=-1):void
        {
            if (_tracking)
            {
                _tracking.trackGoogle(_arg_1, _arg_2, _arg_3);
            };
        }

        public function get tracking():_SafeStr_1704
        {
            return (_tracking);
        }

        public function openNavigator(_arg_1:Point=null):void
        {
        }

        public function closeNavigator():void
        {
            _SafeStr_3741.close();
        }

        public function goToMainView():void
        {
            _SafeStr_3744.hide();
            _SafeStr_3743.close();
        }

        public function get homeRoomId():int
        {
            return ((_SafeStr_3740) ? _SafeStr_3740.homeRoomId : -1);
        }

        public function get webRoomReport():Boolean
        {
            return (_SafeStr_3752);
        }

        public function get webRoomReportedName():String
        {
            return (_webRoomReportedName);
        }

        public function get enteredGuestRoomData():_SafeStr_1569
        {
            if (_SafeStr_3740)
            {
                return (_SafeStr_3740.enteredGuestRoom);
            };
            return (null);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
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
                                goToHomeRoom();
                                break;
                            default:
                                _local_3 = _local_2[2];
                                if (_local_3 > 0)
                                {
                                    goToPrivateRoom(_local_3);
                                }
                                else
                                {
                                    send(new _SafeStr_372(_local_2[2]));
                                };
                        };
                    };
                    return;
                case "search":
                    if (_local_2.length > 2)
                    {
                        performTextSearch(_local_2[2]);
                    };
                    return;
                case "tag":
                    if (_local_2.length > 2)
                    {
                        performTagSearch(_local_2[2]);
                    };
                    return;
                case "tab":
                    if (_local_2.length > 2)
                    {
                        tabs.setSelectedTab(Tabs.tabIdFromName(_local_2[2], 2));
                        openNavigator(null);
                    };
                    return;
                case "report":
                    if (_local_2.length > 3)
                    {
                        enterRoomWebRequest(_local_2[2], true, _local_2[3]);
                    };
                    return;
                default:
                    _SafeStr_14.log(("Navigator unknown link-type received: " + _local_2[1]));
                    return;
            };
        }

        private function onPerksUpdated(_arg_1:PerksUpdatedEvent):void
        {
            if (!_sessionData.isPerkAllowed("NAVIGATOR_PHASE_TWO_2014"))
            {
                if (((_SafeStr_3741) && (!(_SafeStr_3741.isPhaseOneNavigator == isPerkAllowed("NAVIGATOR_PHASE_ONE_2014")))))
                {
                    _SafeStr_3741.close();
                };
                context.addLinkEventTracker(this);
            }
            else
            {
                context.removeLinkEventTracker(this);
            };
        }

        public function showToolbarHover(_arg_1:Point):void
        {
            if (!_toolbarHover)
            {
                _toolbarHover = new ToolbarHoverCtrl(this);
            };
            _toolbarHover.show(_arg_1);
        }

        public function hideToolbarHover(_arg_1:Boolean):void
        {
            if (!_toolbarHover)
            {
                return;
            };
            if (_arg_1)
            {
                _toolbarHover.hideDelayed();
            }
            else
            {
                _toolbarHover.hide();
            };
        }

        public function get isDoorModeOverriddenInCurrentRoom():Boolean
        {
            return (_catalog.isDoorModeOverriddenInCurrentRoom);
        }

        public function isPerkAllowed(_arg_1:String):Boolean
        {
            if (_sessionData)
            {
                return (_sessionData.isPerkAllowed(_arg_1));
            };
            return (false);
        }

        public function canRateRoom():Boolean
        {
            if (!data)
            {
                return (false);
            };
            return (data.canRate);
        }

        public function isRoomFavorite(_arg_1:int):Boolean
        {
            if (!data)
            {
                return (false);
            };
            return (data.isRoomFavourite(_arg_1));
        }

        public function isRoomHome(_arg_1:int):Boolean
        {
            if (!data)
            {
                return (false);
            };
            return (data.isRoomHome(_arg_1));
        }

        public function get visibleEventCategories():Array
        {
            if (!data)
            {
                return ([]);
            };
            return (data.visibleEventCategories);
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_119 = "_-H4" (String#30299, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1559 = "_-S7" (String#12977, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3118 = "_-wi" (String#2138, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_372 = "_-N1R" (String#21312, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3741 = "_-q2" (String#2630, DoABC#4)
// _SafeStr_3742 = "_-p7" (String#1631, DoABC#4)
// _SafeStr_3743 = "_-c1N" (String#3794, DoABC#4)
// _SafeStr_3744 = "_-Ev" (String#4514, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)
// _SafeStr_3746 = "_-M1C" (String#5734, DoABC#4)
// _SafeStr_3747 = "_-V1" (String#3373, DoABC#4)
// _SafeStr_3748 = "_-Y10" (String#5769, DoABC#4)
// _SafeStr_3749 = "_-kv" (String#8574, DoABC#4)
// _SafeStr_3750 = "_-Cp" (String#5670, DoABC#4)
// _SafeStr_3751 = "_-eg" (String#7256, DoABC#4)
// _SafeStr_3752 = "_-J15" (String#22239, DoABC#4)
// _SafeStr_3757 = "_-iH" (String#1838, DoABC#4)
// _SafeStr_500 = "_-NI" (String#29823, DoABC#4)
// _SafeStr_525 = "_-c1I" (String#3620, DoABC#4)


