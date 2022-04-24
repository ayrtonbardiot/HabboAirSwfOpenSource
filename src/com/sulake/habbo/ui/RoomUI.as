// by nota

//com.sulake.habbo.ui.RoomUI

package com.sulake.habbo.ui
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.friendlist._SafeStr_1874;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.inventory._SafeStr_1708;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.habbo.navigator.IHabboNewNavigator;
    import com.sulake.habbo.groups._SafeStr_1757;
    import com.sulake.habbo.avatar._SafeStr_1758;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.advertisement._SafeStr_1705;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.messenger._SafeStr_1700;
    import com.sulake.habbo.moderation.IHabboModeration;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.habbo.game._SafeStr_1699;
    import com.sulake.habbo.friendbar.IHabboFriendBar;
    import com.sulake.habbo.friendbar.view._SafeStr_3185;
    import com.sulake.habbo.friendbar.IHabboLandingView;
    import com.sulake.habbo.quest._SafeStr_2046;
    import com.sulake.habbo.freeflowchat._SafeStr_1703;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.RoomWidgetFactory;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboInventory;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboNewNavigator;
    import com.sulake.iid.IIDHabboGroupsManager;
    import com.sulake.iid.IIDHabboAvatarEditor;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboAdManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboModeration;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboUserDefinedRoomEvents;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboGameManager;
    import com.sulake.iid.IIDHabboFriendBar;
    import com.sulake.iid.IIDHabboFriendBarView;
    import com.sulake.iid.IIDHabboLandingView;
    import com.sulake.iid.IIDHabboQuestEngine;
    import com.sulake.iid.IIDHabboMessenger;
    import com.sulake.iid.IIDHabboFreeFlowChat;
    import __AS3__.vec.Vector;
    import _-111._SafeStr_779;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.advertisement.events.InterstitialEvent;
    import com.sulake.habbo.friendbar.events.FriendBarResizeEvent;
    import _-e1A._SafeStr_165;
    import com.sulake.habbo.advertisement.events.AdEvent;
    import flash.utils.Timer;
    import com.sulake.habbo.ui.widget.events.RoomDesktopMouseZoomEnableEvent;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.room.utils.RoomId;
    import com.sulake.habbo.room.events.RoomEngineRoomColorEvent;
    import com.sulake.habbo.room.events.RoomEngineZoomEvent;
    import com.sulake.habbo.room.events.RoomEngineHSLColorEnableEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import flash.events.Event;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components._SafeStr_3189;
    import com.sulake.habbo.ui.widget.events.HideRoomWidgetEvent;
    import flash.events.MouseEvent;
    import com.sulake.habbo.freeflowchat.style._SafeStr_3260;

    public class RoomUI extends _SafeStr_20 implements IRoomUI, _SafeStr_41 
    {

        private var _windowManager:_SafeStr_1695;
        private var _roomEngine:IRoomEngine;
        private var _roomSessionManager:IRoomSessionManager;
        private var _SafeStr_3938:IRoomWidgetFactory;
        private var _sessionDataManager:ISessionDataManager;
        private var _friendList:_SafeStr_1874;
        private var _avatarRenderManager:_SafeStr_1701;
        private var _inventory:_SafeStr_1708;
        private var _toolbar:IHabboToolbar;
        private var _navigator:_SafeStr_1696;
        private var _newNavigator:IHabboNewNavigator;
        private var _habboGroupsManager:_SafeStr_1757;
        private var _avatarEditor:_SafeStr_1758;
        private var _catalog:IHabboCatalog;
        private var _adManager:_SafeStr_1705;
        private var _localization:_SafeStr_18;
        private var _habboHelp:IHabboHelp;
        private var _messenger:_SafeStr_1700;
        private var _moderation:IHabboModeration;
        private var _soundManager:_SafeStr_2088;
        private var _gameManager:_SafeStr_1699;
        private var _friendBar:IHabboFriendBar;
        private var _friendBarView:_SafeStr_3185;
        private var _landingView:IHabboLandingView;
        private var _questEngine:_SafeStr_2046;
        private var _freeFlowChat:_SafeStr_1703;
        private var _communication:IHabboCommunicationManager;
        private var _SafeStr_3939:_SafeStr_24;
        private var _SafeStr_3944:int = -1;
        private var _SafeStr_3942:Boolean;
        private var _SafeStr_3940:int;
        private var _habboTracking:_SafeStr_1704;
        private var _userDefinedRoomEvents:IHabboUserDefinedRoomEvents;
        private var _SafeStr_3941:Boolean = false;
        private var _isInRoom:Boolean = false;
        private var _perkAllowancesMessageEvent:IMessageEvent;

        public function RoomUI(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_3938 = new RoomWidgetFactory(this);
            _SafeStr_3939 = new _SafeStr_24();
            registerUpdateReceiver(this, 0);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDRoomEngine(), function (_arg_1:IRoomEngine):void
            {
                _roomEngine = _arg_1;
            }, true, [{
                "type":"REE_ENGINE_INITIALIZED",
                "callback":roomEngineEventHandler
            }, {
                "type":"REE_INITIALIZED",
                "callback":roomEventHandler
            }, {
                "type":"REE_OBJECTS_INITIALIZED",
                "callback":roomEngineEventHandler
            }, {
                "type":"REE_DISPOSED",
                "callback":roomEventHandler
            }, {
                "type":"REE_NORMAL_MODE",
                "callback":roomEngineEventHandler
            }, {
                "type":"REE_GAME_MODE",
                "callback":roomEngineEventHandler
            }, {
                "type":"REDSE_ROOM_COLOR",
                "callback":roomEventHandler
            }, {
                "type":"REE_ROOM_COLOR",
                "callback":roomEventHandler
            }, {
                "type":"REE_ROOM_ZOOM",
                "callback":roomEventHandler
            }, {
                "type":"ROHSLCEE_ROOM_BACKGROUND_COLOR",
                "callback":roomEventHandler
            }, {
                "type":"REOE_SELECTED",
                "callback":roomObjectEventHandler
            }, {
                "type":"REOE_DESELECTED",
                "callback":roomObjectEventHandler
            }, {
                "type":"REOE_ADDED",
                "callback":roomObjectEventHandler
            }, {
                "type":"REOE_REMOVED",
                "callback":roomObjectEventHandler
            }, {
                "type":"REOE_PLACED",
                "callback":roomObjectEventHandler
            }, {
                "type":"REOE_REQUEST_MOVE",
                "callback":roomObjectEventHandler
            }, {
                "type":"REOE_REQUEST_ROTATE",
                "callback":roomObjectEventHandler
            }, {
                "type":"REOE_MOUSE_ENTER",
                "callback":roomObjectEventHandler
            }, {
                "type":"REOE_MOUSE_LEAVE",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_OPEN_WIDGET",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_CLOSE_WIDGET",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_OPEN_FURNI_CONTEXT_MENU",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_CLOSE_FURNI_CONTEXT_MENU",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_CREDITFURNI",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_STICKIE",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_PRESENT",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_TROPHY",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_TEASER",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_ECOTRONBOX",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_PLACEHOLDER",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_DIMMER",
                "callback":roomObjectEventHandler
            }, {
                "type":"RERAE_FURNI_CLICK",
                "callback":roomObjectEventHandler
            }, {
                "type":"RERAE_FURNI_DOUBLE_CLICK",
                "callback":roomObjectEventHandler
            }, {
                "type":"RERAE_TOOLTIP_SHOW",
                "callback":roomObjectEventHandler
            }, {
                "type":"RERAE_TOOLTIP_HIDE",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REMOVE_DIMMER",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_CLOTHING_CHANGE",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_PLAYLIST_EDITOR",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_MANNEQUIN",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_BACKGROUND_COLOR",
                "callback":roomObjectEventHandler
            }, {
                "type":"ROSM_USE_PRODUCT_FROM_INVENTORY",
                "callback":roomObjectEventHandler
            }, {
                "type":"ROSM_USE_PRODUCT_FROM_ROOM",
                "callback":roomObjectEventHandler
            }, {
                "type":"ROSM_JUKEBOX_DISPOSE",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_BADGE_DISPLAY_ENGRAVING",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_FRIEND_FURNITURE_ENGRAVING",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_HIGH_SCORE_DISPLAY",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_HIDE_HIGH_SCORE_DISPLAY",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_INTERNAL_LINK",
                "callback":roomObjectEventHandler
            }, {
                "type":"RETWE_REQUEST_ROOM_LINK",
                "callback":roomObjectEventHandler
            }]), new ComponentDependency(new IIDHabboRoomSessionManager(), function (_arg_1:IRoomSessionManager):void
            {
                _roomSessionManager = _arg_1;
            }, true, [{
                "type":"RSE_CREATED",
                "callback":roomSessionStateEventHandler
            }, {
                "type":"RSE_STARTED",
                "callback":roomSessionStateEventHandler
            }, {
                "type":"RSE_ENDED",
                "callback":roomSessionStateEventHandler
            }, {
                "type":"RSE_ROOM_DATA",
                "callback":roomSessionStateEventHandler
            }, {
                "type":"RSCE_CHAT_EVENT",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSCE_FLOOD_EVENT",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSUBE_BADGES",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSDE_DOORBELL",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSDE_REJECTED",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSDE_ACCEPTED",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSPE_PRESENT_OPENED",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSOPPE_OPEN_PET_PACKAGE_REQUESTED",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSOPPE_OPEN_PET_PACKAGE_RESULT",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSEME_KICKED",
                "callback":roomSessionDialogEventHandler
            }, {
                "type":"RSEME_PETS_FORBIDDEN_IN_HOTEL",
                "callback":roomSessionDialogEventHandler
            }, {
                "type":"RSEME_PETS_FORBIDDEN_IN_FLAT",
                "callback":roomSessionDialogEventHandler
            }, {
                "type":"RSEME_MAX_PETS",
                "callback":roomSessionDialogEventHandler
            }, {
                "type":"RSEME_MAX_NUMBER_OF_OWN_PETS",
                "callback":roomSessionDialogEventHandler
            }, {
                "type":"RSEME_NO_FREE_TILES_FOR_PET",
                "callback":roomSessionDialogEventHandler
            }, {
                "type":"RSEME_SELECTED_TILE_NOT_FREE_FOR_PET",
                "callback":roomSessionDialogEventHandler
            }, {
                "type":"RSEME_BOTS_FORBIDDEN_IN_HOTEL",
                "callback":roomSessionDialogEventHandler
            }, {
                "type":"RSEME_BOTS_FORBIDDEN_IN_FLAT",
                "callback":roomSessionDialogEventHandler
            }, {
                "type":"RSEME_BOT_LIMIT_REACHED",
                "callback":roomSessionDialogEventHandler
            }, {
                "type":"RSEME_SELECTED_TILE_NOT_FREE_FOR_BOT",
                "callback":roomSessionDialogEventHandler
            }, {
                "type":"RSEME_BOT_NAME_NOT_ACCEPTED",
                "callback":roomSessionDialogEventHandler
            }, {
                "type":"RSQE_QUEUE_STATUS",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSPE_POLL_CONTENT",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSPE_POLL_ERROR",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSPE_POLL_OFFER",
                "callback":roomSessionEventHandler
            }, {
                "type":"RWPUW_QUESTION_ANSWERED",
                "callback":roomSessionEventHandler
            }, {
                "type":"RWPUW_QUESION_FINSIHED",
                "callback":roomSessionEventHandler
            }, {
                "type":"RWPUW_NEW_QUESTION",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSDPE_PRESETS",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSFRE_FRIEND_REQUEST",
                "callback":roomSessionEventHandler
            }, {
                "type":"rsudue_user_data_updated",
                "callback":roomSessionEventHandler
            }, {
                "type":"RSDE_DANCE",
                "callback":roomSessionEventHandler
            }]), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }), new ComponentDependency(new IIDHabboFriendList(), function (_arg_1:_SafeStr_1874):void
            {
                _friendList = _arg_1;
            }), new ComponentDependency(new IIDAvatarRenderManager(), function (_arg_1:_SafeStr_1701):void
            {
                _avatarRenderManager = _arg_1;
            }), new ComponentDependency(new IIDHabboInventory(), function (_arg_1:_SafeStr_1708):void
            {
                _inventory = _arg_1;
            }), new ComponentDependency(new IIDHabboToolbar(), function (_arg_1:IHabboToolbar):void
            {
                _toolbar = _arg_1;
            }), new ComponentDependency(new IIDHabboNavigator(), function (_arg_1:_SafeStr_1696):void
            {
                _navigator = _arg_1;
            }), new ComponentDependency(new IIDHabboNewNavigator(), function (_arg_1:IHabboNewNavigator):void
            {
                _newNavigator = _arg_1;
            }), new ComponentDependency(new IIDHabboGroupsManager(), function (_arg_1:_SafeStr_1757):void
            {
                _habboGroupsManager = _arg_1;
            }), new ComponentDependency(new IIDHabboAvatarEditor(), function (_arg_1:_SafeStr_1758):void
            {
                _avatarEditor = _arg_1;
            }), new ComponentDependency(new IIDHabboCatalog(), function (_arg_1:IHabboCatalog):void
            {
                _catalog = _arg_1;
            }), new ComponentDependency(new IIDHabboAdManager(), function (_arg_1:_SafeStr_1705):void
            {
                _adManager = _arg_1;
            }, true, [{
                "type":"AE_INTERSTITIAL_NOT_SHOWN",
                "callback":interstitialNotAvailableEventHandler
            }, {
                "type":"AE_INTERSTITIAL_COMPLETE",
                "callback":interstitialCompleteEventHandler
            }, {
                "type":"AE_INTERSTITIAL_SHOW",
                "callback":interstitialShowEventHandler
            }, {
                "type":"AE_ROOM_AD_SHOW",
                "callback":adEventHandler
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            }), new ComponentDependency(new IIDHabboHelp(), function (_arg_1:IHabboHelp):void
            {
                _habboHelp = _arg_1;
            }), new ComponentDependency(new IIDHabboModeration(), function (_arg_1:IHabboModeration):void
            {
                _moderation = _arg_1;
            }), new ComponentDependency(new IIDHabboSoundManager(), function (_arg_1:_SafeStr_2088):void
            {
                _soundManager = _arg_1;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communication = _arg_1;
            }), new ComponentDependency(new IIDHabboUserDefinedRoomEvents(), function (_arg_1:IHabboUserDefinedRoomEvents):void
            {
                _userDefinedRoomEvents = _arg_1;
            }), new ComponentDependency(new IIDHabboTracking(), function (_arg_1:_SafeStr_1704):void
            {
                _habboTracking = _arg_1;
            }), new ComponentDependency(new IIDHabboGameManager(), function (_arg_1:_SafeStr_1699):void
            {
                _gameManager = _arg_1;
            }, true, [{
                "type":"gce_game_chat",
                "callback":gameEventHandler
            }]), new ComponentDependency(new IIDHabboFriendBar(), function (_arg_1:IHabboFriendBar):void
            {
                _friendBar = _arg_1;
            }), new ComponentDependency(new IIDHabboFriendBarView(), function (_arg_1:_SafeStr_3185):void
            {
                _friendBarView = _arg_1;
            }, true, [{
                "type":"FBE_BAR_RESIZE_EVENT",
                "callback":bottomBarResizeHandler
            }]), new ComponentDependency(new IIDHabboLandingView(), function (_arg_1:IHabboLandingView):void
            {
                _landingView = _arg_1;
            }), new ComponentDependency(new IIDHabboQuestEngine(), function (_arg_1:_SafeStr_2046):void
            {
                _questEngine = _arg_1;
            }), new ComponentDependency(new IIDHabboMessenger(), function (_arg_1:_SafeStr_1700):void
            {
                _messenger = _arg_1;
            }), new ComponentDependency(new IIDHabboFreeFlowChat(), function (_arg_1:_SafeStr_1703):void
            {
                _freeFlowChat = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            _perkAllowancesMessageEvent = _communication.addHabboConnectionMessageEvent(new _SafeStr_779(onPerkAllowances));
        }

        override public function dispose():void
        {
            var _local_2:* = null;
            var _local_1:* = null;
            if (disposed)
            {
                return;
            };
            if (_SafeStr_3938 != null)
            {
                _SafeStr_3938.dispose();
                _SafeStr_3938 = null;
            };
            if (_communication != null)
            {
                _communication.removeHabboConnectionMessageEvent(_perkAllowancesMessageEvent);
                _perkAllowancesMessageEvent = null;
            };
            if (_SafeStr_3939 != null)
            {
                while (_SafeStr_3939.length > 0)
                {
                    _local_2 = (_SafeStr_3939.getKey(0) as String);
                    _local_1 = (_SafeStr_3939.remove(_local_2) as RoomDesktop);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                };
                _SafeStr_3939.dispose();
                _SafeStr_3939 = null;
            };
            removeUpdateReceiver(this);
            super.dispose();
        }

        private function roomSessionStateEventHandler(_arg_1:RoomSessionEvent):void
        {
            if (_roomEngine == null)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "RSE_CREATED":
                    createDesktop(_arg_1.session);
                    if (_arg_1.session.isGameSession)
                    {
                        if (_toolbar)
                        {
                            _toolbar.setToolbarState("HTE_STATE_HIDDEN");
                        };
                        if (_friendBar)
                        {
                            _friendBar.visible = false;
                        };
                        if (_landingView)
                        {
                            _landingView.disable();
                        };
                    };
                    return;
                case "RSE_STARTED":
                    if (_toolbar)
                    {
                        defineToolbarState(_arg_1.session);
                    };
                    if (_landingView)
                    {
                        _landingView.disable();
                    };
                    return;
                case "RSE_ROOM_DATA":
                    defineToolbarState(_arg_1.session);
                    return;
                case "RSE_ENDED":
                    if (_arg_1.session != null)
                    {
                        disposeDesktop(getRoomIdentifier(_arg_1.session.roomId));
                        if (_arg_1.session.isGameSession)
                        {
                            _friendBar.visible = true;
                            if (_gameManager)
                            {
                                _gameManager.onSnowWarArenaSessionEnded();
                            };
                        }
                        else
                        {
                            if (_arg_1.openLandingPage)
                            {
                                if (((getBoolean("nux.lobbies.enabled")) && (_sessionDataManager.isRealNoob)))
                                {
                                    if (((_navigator.enteredGuestRoomData) && (_navigator.enteredGuestRoomData.doorMode == 4)))
                                    {
                                        _navigator.goToHomeRoom();
                                    }
                                    else
                                    {
                                        context.createLinkEvent("navigator/goto/predefined_noob_lobby");
                                    };
                                }
                                else
                                {
                                    if (_landingView)
                                    {
                                        _landingView.activate();
                                    };
                                };
                            };
                        };
                    };
                    return;
            };
        }

        private function defineToolbarState(_arg_1:IRoomSession):void
        {
            if (((getBoolean("nux.lobbies.enabled")) && (_sessionDataManager.isRealNoob)))
            {
                if (((_arg_1) && (_arg_1.isNoobRoom)))
                {
                    _toolbar.setToolbarState("HTE_STATE_NOOB_NOT_HOME");
                }
                else
                {
                    _toolbar.setToolbarState("HETE_STATE_NOOB_HOME");
                };
            }
            else
            {
                _toolbar.setToolbarState("HTE_STATE_ROOM_VIEW");
            };
        }

        private function roomSessionEventHandler(_arg_1:RoomSessionEvent):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (_roomEngine == null)
            {
                return;
            };
            if (_arg_1.session != null)
            {
                _local_2 = getRoomIdentifier(_arg_1.session.roomId);
                _local_3 = getDesktop(_local_2);
                if (_local_3 != null)
                {
                    _local_3.processEvent(_arg_1);
                };
            };
        }

        private function roomSessionDialogEventHandler(_arg_1:RoomSessionEvent):void
        {
            var event = _arg_1;
            var errorTitle:String = "${error.title}";
            switch (event.type)
            {
                case "RSEME_MAX_PETS":
                    var errorMessage:String = "${room.error.max_pets}";
                    break;
                case "RSEME_MAX_NUMBER_OF_OWN_PETS":
                    errorMessage = "${room.error.max_own_pets}";
                    break;
                case "RSEME_KICKED":
                    errorMessage = "${room.error.kicked}";
                    errorTitle = "${generic.alert.title}";
                    break;
                case "RSEME_PETS_FORBIDDEN_IN_HOTEL":
                    errorMessage = "${room.error.pets.forbidden_in_hotel}";
                    break;
                case "RSEME_PETS_FORBIDDEN_IN_FLAT":
                    errorMessage = "${room.error.pets.forbidden_in_flat}";
                    break;
                case "RSEME_NO_FREE_TILES_FOR_PET":
                    errorMessage = "${room.error.pets.no_free_tiles}";
                    break;
                case "RSEME_SELECTED_TILE_NOT_FREE_FOR_PET":
                    errorMessage = "${room.error.pets.selected_tile_not_free}";
                    break;
                case "RSEME_BOTS_FORBIDDEN_IN_HOTEL":
                    errorMessage = "${room.error.bots.forbidden_in_hotel}";
                    break;
                case "RSEME_BOTS_FORBIDDEN_IN_FLAT":
                    errorMessage = "${room.error.bots.forbidden_in_flat}";
                    break;
                case "RSEME_BOT_LIMIT_REACHED":
                    errorMessage = "${room.error.max_bots}";
                    break;
                case "RSEME_SELECTED_TILE_NOT_FREE_FOR_BOT":
                    errorMessage = "${room.error.bots.selected_tile_not_free}";
                    break;
                case "RSEME_BOT_NAME_NOT_ACCEPTED":
                    errorMessage = "${room.error.bots.name.not.accepted}";
                    break;
                default:
                    return;
            };
            _windowManager.alert(errorTitle, errorMessage, 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
            {
                _arg_1.dispose();
            });
        }

        private function interstitialShowEventHandler(_arg_1:InterstitialEvent):void
        {
            var _local_2:String = getRoomIdentifier(_SafeStr_3940);
            var _local_3:RoomDesktop = (getDesktop(_local_2) as RoomDesktop);
            if (_local_3 != null)
            {
                _local_3.processEvent(_arg_1);
            };
            _SafeStr_3942 = true;
        }

        public function triggerbottomBarResize():void
        {
            bottomBarResizeHandler(new FriendBarResizeEvent());
        }

        private function bottomBarResizeHandler(_arg_1:FriendBarResizeEvent):void
        {
            var _local_2:String = getRoomIdentifier(_roomEngine.activeRoomId);
            var _local_3:RoomDesktop = (getDesktop(_local_2) as RoomDesktop);
            if (_local_3 != null)
            {
                _local_3.processEvent(_arg_1);
            };
        }

        private function interstitialNotAvailableEventHandler(_arg_1:InterstitialEvent):void
        {
            _SafeStr_3942 = false;
        }

        private function interstitialCompleteEventHandler(_arg_1:InterstitialEvent):void
        {
            var _local_4:* = null;
            _SafeStr_3942 = false;
            if (_arg_1.status == "complete")
            {
                _communication.connection.send(new _SafeStr_165());
            };
            var _local_2:String = getRoomIdentifier(_SafeStr_3940);
            var _local_3:RoomDesktop = (getDesktop(_local_2) as RoomDesktop);
            if (_local_3 != null)
            {
                _local_3.processEvent(_arg_1);
                _local_4 = _roomSessionManager.getSession(_roomEngine.activeRoomId);
                if (_local_4 != null)
                {
                    _local_4.sendChangePostureMessage(0);
                };
            };
        }

        private function adEventHandler(_arg_1:AdEvent):void
        {
            var _local_2:String = getRoomIdentifier(_arg_1.roomId);
            var _local_3:RoomDesktop = (getDesktop(_local_2) as RoomDesktop);
            if (_local_3 != null)
            {
                _local_3.processEvent(_arg_1);
            };
        }

        private function onPerkAllowances(_arg_1:_SafeStr_779):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            if (((((_freeFlowChat) && (!(_freeFlowChat.isDisabledInPreferences))) && (_isInRoom)) && (!(_SafeStr_3941))))
            {
                _local_3 = new Timer(250, 1);
                _local_3.addEventListener("timerComplete", delayedAddToStageFreeFlowChat);
                _local_3.start();
            };
            if (_isInRoom)
            {
                _local_2 = getRoomIdentifier(_roomEngine.activeRoomId);
                _local_4 = (getDesktop(_local_2) as RoomDesktop);
                if (_local_4 != null)
                {
                    _local_4.processEvent(new RoomDesktopMouseZoomEnableEvent(_arg_1.getParser().isPerkAllowed("MOUSE_ZOOM")));
                };
            };
        }

        private function delayedAddToStageFreeFlowChat(_arg_1:TimerEvent):void
        {
            var _local_2:RoomDesktop = (getDesktop(getRoomIdentifier(_roomEngine.activeRoomId)) as RoomDesktop);
            if (((_local_2) && (_freeFlowChat.displayObject)))
            {
                _local_2.layoutManager.getChatContainer().setDisplayObject(_freeFlowChat.displayObject);
                _SafeStr_3941 = true;
            };
        }

        private function roomEngineEventHandler(_arg_1:RoomEngineEvent):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            if (((_arg_1.type == "REE_GAME_MODE") || (_arg_1.type == "REE_NORMAL_MODE")))
            {
                _local_2 = getRoomIdentifier(_arg_1.roomId);
                _local_3 = (getDesktop(_local_2) as RoomDesktop);
                if (_local_3 != null)
                {
                    _local_3.roomEngineEventHandler(_arg_1);
                };
            };
            if (_arg_1.roomId == _SafeStr_3940)
            {
                if (_arg_1.type == "REE_OBJECTS_INITIALIZED")
                {
                    if (_SafeStr_3942 == true)
                    {
                        _local_4 = _roomSessionManager.getSession(_SafeStr_3940);
                        if (_local_4 != null)
                        {
                            _local_4.sendAvatarExpressionMessage(AvatarExpressionEnum._SafeStr_3943.ordinal);
                        };
                    };
                    _SafeStr_3942 = false;
                }
                else
                {
                    if (_arg_1.type == "REE_DISPOSED")
                    {
                        _SafeStr_3942 = false;
                    };
                };
            };
        }

        private function roomEventHandler(_arg_1:RoomEngineEvent):void
        {
            var _local_5:* = null;
            var _local_6:* = null;
            var _local_3:* = null;
            var _local_7:* = null;
            if (_roomEngine == null)
            {
                return;
            };
            var _local_2:String = getRoomIdentifier(_arg_1.roomId);
            var _local_4:RoomDesktop = (getDesktop(_local_2) as RoomDesktop);
            if (_local_4 == null)
            {
                if (_roomSessionManager == null)
                {
                    return;
                };
                _local_5 = _roomSessionManager.getSession(_arg_1.roomId);
                if (_local_5 != null)
                {
                    _local_4 = (createDesktop(_local_5) as RoomDesktop);
                };
            };
            if (_local_4 == null)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "REE_INITIALIZED":
                    _local_4.createRoomView(getActiveCanvasId(_arg_1.roomId));
                    if (((!(_roomEngine == null)) && (!(RoomId.isRoomPreviewerId(_arg_1.roomId)))))
                    {
                        _roomEngine.setActiveRoom(_arg_1.roomId);
                    };
                    _local_4.disposeWidget("RWE_ROOM_QUEUE");
                    _local_4.createWidget("RWE_CHAT_WIDGET");
                    if (((_freeFlowChat) && (!(_freeFlowChat.isDisabledInPreferences))))
                    {
                        _SafeStr_3941 = true;
                        if (_freeFlowChat.displayObject != null)
                        {
                            _local_4.layoutManager.getChatContainer().setDisplayObject(_freeFlowChat.displayObject);
                        };
                    };
                    _local_4.createWidget("RWE_INFOSTAND");
                    _local_4.createWidget("RWE_LOCATION_WIDGET");
                    _local_4.createWidget("RWE_ROOM_TOOLS");
                    if (!_local_4.session.isSpectatorMode)
                    {
                        _local_4.createWidget("RWE_ME_MENU");
                        _local_4.createWidget("RWE_CHAT_INPUT_WIDGET");
                        _local_4.createWidget("RWE_FRIEND_REQUEST");
                        if (getBoolean("avatar.widget.enabled"))
                        {
                            _local_4.createWidget("RWE_AVATAR_INFO");
                        };
                    };
                    _local_4.createWidget("RWE_FURNI_PLACEHOLDER");
                    _local_4.createWidget("RWE_FURNI_CREDIT_WIDGET");
                    _local_4.createWidget("RWE_FURNI_STICKIE_WIDGET");
                    _local_4.createWidget("RWE_FURNI_PRESENT_WIDGET");
                    _local_4.createWidget("RWE_FURNI_TROPHY_WIDGET");
                    _local_4.createWidget("RWE_FURNI_ECOTRONBOX_WIDGET");
                    _local_4.createWidget("RWE_FURNI_PET_PACKAGE_WIDGET");
                    _local_4.createWidget("RWE_DOORBELL");
                    _local_4.createWidget("RWE_ROOM_POLL");
                    _local_4.createWidget("RWE_ROOM_DIMMER");
                    _local_4.createWidget("RWE_CLOTHING_CHANGE");
                    _local_4.createWidget("RWE_CONVERSION_TRACKING");
                    if (!getBoolean("memenu.effects.widget.disabled"))
                    {
                        _local_4.createWidget("RWE_EFFECTS");
                    };
                    _local_4.createWidget("RWE_MANNEQUIN");
                    _local_4.createWidget("RWE_ROOM_BACKGROUND_COLOR");
                    _local_4.createWidget("RWE_CUSTOM_USER_NOTIFICATION");
                    _local_4.createWidget("RWE_FURNI_CHOOSER");
                    _local_4.createWidget("RWE_USER_CHOOSER");
                    if (_SafeStr_3944 != -1)
                    {
                        _local_4.initializeWidget("RWE_USER_CHOOSER", _SafeStr_3944);
                    };
                    _local_4.createWidget("RWE_PLAYLIST_EDITOR_WIDGET");
                    _local_4.createWidget("RWE_SPAMWALL_POSTIT_WIDGET");
                    _local_4.createWidget("RWE_FURNITURE_CONTEXT_MENU");
                    _local_4.createWidget("RWE_CAMERA");
                    _local_4.createWidget("RWE_FURNI_ACHIEVEMENT_RESOLUTION_ENGRAVING");
                    _local_4.createWidget("RWE_FRIEND_FURNI_CONFIRM");
                    _local_4.createWidget("RWE_FRIEND_FURNI_ENGRAVING");
                    _local_4.createWidget("RWE_HIGH_SCORE_DISPLAY");
                    _local_4.createWidget("RWE_INTERNAL_LINK");
                    _local_4.createWidget("RWE_CUSTOM_STACK_HEIGHT");
                    _local_4.createWidget("RWE_YOUTUBE");
                    _local_4.createWidget("RWE_RENTABLESPACE");
                    _local_4.createWidget("RWE_VIMEO");
                    _local_4.createWidget("RWE_EXTERNAL_IMAGE");
                    _local_4.createWidget("RWE_UI_HELP_BUBBLE");
                    _local_4.createWidget("RWE_WORD_QUIZZ");
                    _local_4.createWidget("RWE_ROOM_THUMBNAIL_CAMERA");
                    _local_4.createWidget("RWE_ROOM_LINK");
                    _local_4.createWidget("RWE_CRAFTING");
                    _isInRoom = true;
                    return;
                case "REE_DISPOSED":
                    disposeDesktop(_local_2);
                    _isInRoom = false;
                    return;
                case "REE_ROOM_COLOR":
                    _local_6 = (_arg_1 as RoomEngineRoomColorEvent);
                    if (_local_6 == null) break;
                    if (_local_6.bgOnly)
                    {
                        _local_4.setRoomViewColor(0xFFFFFF, 0xFF);
                    }
                    else
                    {
                        _local_4.setRoomViewColor(_local_6.color, _local_6.brightness);
                    };
                    return;
                case "REE_ROOM_ZOOM":
                    _local_3 = (_arg_1 as RoomEngineZoomEvent);
                    if (_local_3 == null) break;
                    _roomEngine.setRoomCanvasScale(_roomEngine.activeRoomId, getActiveCanvasId(_roomEngine.activeRoomId), ((_local_3.level < 1) ? 0.5 : (1 << (Math.floor(_local_3.level) - 1))), null, null, _local_3.isFlipForced);
                    return;
                case "REDSE_ROOM_COLOR":
                    _local_4.processEvent(_arg_1);
                    return;
                case "ROHSLCEE_ROOM_BACKGROUND_COLOR":
                    _local_7 = RoomEngineHSLColorEnableEvent(_arg_1);
                    if (!_local_7.enable)
                    {
                        _local_4.setRoomBackgroundColor(0, 0, 0);
                    }
                    else
                    {
                        _local_4.setRoomBackgroundColor(_local_7.hue, _local_7.saturation, _local_7.lightness);
                    };
                    return;
            };
        }

        private function roomObjectEventHandler(_arg_1:RoomEngineObjectEvent):void
        {
            if (_roomEngine == null)
            {
                return;
            };
            var _local_2:String = getRoomIdentifier(_arg_1.roomId);
            var _local_3:RoomDesktop = (getDesktop(_local_2) as RoomDesktop);
            if (_local_3 != null)
            {
                _local_3.roomObjectEventHandler(_arg_1);
            };
        }

        private function gameEventHandler(_arg_1:Event):void
        {
            var _local_2:RoomDesktop = (getDesktop(getRoomIdentifier(0)) as RoomDesktop);
            if (_local_2)
            {
                _local_2.processEvent(_arg_1);
            };
        }

        public function createDesktop(_arg_1:IRoomSession):IRoomDesktop
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            if (_roomEngine == null)
            {
                return (null);
            };
            var _local_3:String = getRoomIdentifier(_arg_1.roomId);
            var _local_2:RoomDesktop = (getDesktop(_local_3) as RoomDesktop);
            if (_local_2 != null)
            {
                return (_local_2);
            };
            _local_2 = new RoomDesktop(_arg_1, assets, _communication.connection);
            _local_2.roomEngine = _roomEngine;
            _local_2.windowManager = _windowManager;
            _local_2.roomWidgetFactory = _SafeStr_3938;
            _local_2.sessionDataManager = _sessionDataManager;
            _local_2.roomSessionManager = _roomSessionManager;
            _local_2.communicationManager = _communication;
            _local_2.friendList = _friendList;
            _local_2.avatarRenderManager = _avatarRenderManager;
            _local_2.inventory = _inventory;
            _local_2.messenger = _messenger;
            _local_2.toolbar = _toolbar;
            _local_2.navigator = _newNavigator.legacyNavigator;
            _local_2.habboGroupsManager = _habboGroupsManager;
            _local_2.avatarEditor = _avatarEditor;
            _local_2.catalog = _catalog;
            _local_2.adManager = _adManager;
            _local_2.localization = _localization;
            _local_2.habboHelp = _habboHelp;
            _local_2.moderation = _moderation;
            _local_2.config = this;
            _local_2.soundManager = _soundManager;
            _local_2.habboTracking = _habboTracking;
            _local_2.userDefinedRoomEvents = _userDefinedRoomEvents;
            _local_2.gameManager = _gameManager;
            _local_2.questEngine = _questEngine;
            _local_2.freeFlowChat = _freeFlowChat;
            var _local_4:XmlAsset = (assets.getAssetByName("room_desktop_layout_xml") as XmlAsset);
            if (_local_4 != null)
            {
                _local_2.layout = (_local_4.content as XML);
            };
            _local_2.createWidget("RWE_LOADINGBAR");
            _local_2.createWidget("RWE_ROOM_QUEUE");
            _local_2.init();
            _local_2.requestInterstitial();
            _SafeStr_3942 = false;
            _SafeStr_3940 = _arg_1.roomId;
            _SafeStr_3939.add(_local_3, _local_2);
            return (_local_2);
        }

        public function get chatContainer():_SafeStr_3189
        {
            var _local_1:RoomDesktop = (getDesktop(getRoomIdentifier(_roomEngine.activeRoomId)) as RoomDesktop);
            if (((!(_local_1)) || (!(_local_1.layoutManager))))
            {
                return (null);
            };
            return (_local_1.layoutManager.getChatContainer());
        }

        public function disposeDesktop(_arg_1:String):void
        {
            var _local_2:int;
            var _local_3:RoomDesktop = (_SafeStr_3939.remove(_arg_1) as RoomDesktop);
            if (_local_3 != null)
            {
                _local_2 = _local_3.getWidgetState("RWE_USER_CHOOSER");
                if (_local_2 != -1)
                {
                    _SafeStr_3944 = _local_2;
                };
                _local_3.dispose();
                _SafeStr_3942 = false;
            };
        }

        public function getDesktop(_arg_1:String):IRoomDesktop
        {
            return (_SafeStr_3939.getValue(_arg_1) as RoomDesktop);
        }

        public function getActiveCanvasId(_arg_1:int):int
        {
            return (1);
        }

        public function update(_arg_1:uint):void
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _SafeStr_3939.length)
            {
                _local_2 = (_SafeStr_3939.getWithIndex(_local_3) as RoomDesktop);
                if (_local_2 != null)
                {
                    _local_2.update();
                };
                _local_3++;
            };
        }

        private function getRoomIdentifier(_arg_1:int):String
        {
            return ("hard_coded_room_id");
        }

        public function set visible(_arg_1:Boolean):void
        {
            var _local_2:RoomDesktop = _SafeStr_3939.getValue(getRoomIdentifier(_roomEngine.activeRoomId));
            if (_local_2 != null)
            {
                _local_2.visible = _arg_1;
            };
        }

        public function hideWidget(_arg_1:String):void
        {
            var _local_2:RoomDesktop = _SafeStr_3939.getValue(getRoomIdentifier(_roomEngine.activeRoomId));
            if (_local_2 != null)
            {
                _local_2.processEvent(new HideRoomWidgetEvent(_arg_1));
            };
        }

        public function showGamePlayerName(_arg_1:int, _arg_2:String, _arg_3:uint, _arg_4:int):void
        {
            var _local_5:RoomDesktop = _SafeStr_3939.getValue(getRoomIdentifier(_roomEngine.activeRoomId));
            if (_local_5 != null)
            {
                _local_5.showGamePlayerName(_arg_1, _arg_2, _arg_3, _arg_4);
            };
        }

        public function mouseEventPositionHasContextMenu(_arg_1:MouseEvent):Boolean
        {
            var _local_2:RoomDesktop = _SafeStr_3939.getValue(getRoomIdentifier(_roomEngine.activeRoomId));
            if (_local_2 != null)
            {
                return (_local_2.mouseEventPositionHasInputEventWindow(_arg_1, 0));
            };
            return (false);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        public function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        public function get inventory():_SafeStr_1708
        {
            return (_inventory);
        }

        public function get roomEngine():IRoomEngine
        {
            return (_roomEngine);
        }

        public function get soundManager():_SafeStr_2088
        {
            return (_soundManager);
        }

        public function get habboTracking():_SafeStr_1704
        {
            return (_habboTracking);
        }

        public function get habboGroupsManager():_SafeStr_1757
        {
            return (_habboGroupsManager);
        }

        public function get friendBarView():_SafeStr_3185
        {
            return (_friendBarView);
        }

        public function get toolbar():IHabboToolbar
        {
            return (_toolbar);
        }

        public function get chatStyleLibrary():_SafeStr_3260
        {
            if (_freeFlowChat)
            {
                return (_freeFlowChat.chatStyleLibrary);
            };
            return (null);
        }

        public function get freeFlowChat():_SafeStr_1703
        {
            return (_freeFlowChat);
        }

        public function get habboHelp():IHabboHelp
        {
            return (_habboHelp);
        }


    }
}//package com.sulake.habbo.ui

// _SafeStr_165 = "_-m1Y" (String#28782, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_1699 = "_-uf" (String#3285, DoABC#4)
// _SafeStr_1700 = "_-eD" (String#3930, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1703 = "_-Q1U" (String#4333, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_1705 = "_-VD" (String#7365, DoABC#4)
// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_1757 = "_-h1P" (String#4520, DoABC#4)
// _SafeStr_1758 = "_-Y5" (String#3968, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_2046 = "_-y13" (String#3747, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3185 = "_-jn" (String#5721, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3260 = "_-K5" (String#11133, DoABC#4)
// _SafeStr_3938 = "_-ab" (String#4849, DoABC#4)
// _SafeStr_3939 = "_-uM" (String#4048, DoABC#4)
// _SafeStr_3940 = "_-m4" (String#10723, DoABC#4)
// _SafeStr_3941 = "_-J9" (String#13757, DoABC#4)
// _SafeStr_3942 = "_-51Z" (String#4690, DoABC#4)
// _SafeStr_3943 = "_-i1k" (String#11339, DoABC#4)
// _SafeStr_3944 = "_-Is" (String#14388, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_779 = "_-s1X" (String#3814, DoABC#4)


