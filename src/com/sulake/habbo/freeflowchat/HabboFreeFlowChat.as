// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.freeflowchat.HabboFreeFlowChat

package com.sulake.habbo.freeflowchat
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.habbo.moderation.IHabboModeration;
    import com.sulake.habbo.ui.IRoomUI;
    import com.sulake.habbo.game._SafeStr_1699;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.freeflowchat.data.ChatEventHandler;
    import com.sulake.habbo.freeflowchat.data.RoomSessionEventHandler;
    import com.sulake.habbo.freeflowchat.history.ChatHistoryBuffer;
    import com.sulake.habbo.freeflowchat.viewer.simulation.ChatFlowStage;
    import com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryScrollView;
    import com.sulake.habbo.freeflowchat.history.visualization.ChatHistoryTray;
    import com.sulake.habbo.freeflowchat.viewer.ChatFlowViewer;
    import com.sulake.habbo.freeflowchat.viewer.ChatBubbleFactory;
    import _-n1H._SafeStr_1626;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import flash.display.Sprite;
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboModeration;
    import com.sulake.iid.IIDHabboRoomUI;
    import com.sulake.iid.IIDHabboGameManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboWindowManager;
    import __AS3__.vec.Vector;
    import _-Ol._SafeStr_484;
    import _-111._SafeStr_779;
    import _-Ja._SafeStr_843;
    import _-R7._SafeStr_214;
    import _-Nk._SafeStr_715;
    import com.sulake.habbo.freeflowchat.data.ChatItem;
    import flash.geom.Point;
    import com.sulake.habbo.configuration.enum.HabboComponentFlags;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.utils.IVector3d;
    import flash.display.DisplayObject;
    import com.sulake.habbo.ui.IRoomDesktop;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
    import com.sulake.habbo.session.IRoomSession;
    import flash.events.MouseEvent;
    import com.sulake.habbo.freeflowchat.style._SafeStr_3260;
    import _-71W._SafeStr_204;
    import _-71W._SafeStr_151;

    public class HabboFreeFlowChat extends _SafeStr_20 implements _SafeStr_1703 
    {

        private var _avatarRenderManager:_SafeStr_1701;
        private var _roomSessionManager:IRoomSessionManager;
        private var _roomEngine:IRoomEngine;
        private var _navigator:_SafeStr_1696;
        private var _moderation:IHabboModeration;
        private var _roomUI:IRoomUI;
        private var _gameManager:_SafeStr_1699;
        private var _localizationManager:_SafeStr_18;
        private var _toolbar:IHabboToolbar;
        private var _communication:_SafeStr_25;
        private var _windowManager:_SafeStr_1695;
        private var _sessionDataManager:ISessionDataManager;
        private var _SafeStr_3775:ChatEventHandler;
        private var _SafeStr_3776:RoomSessionEventHandler;
        private var _SafeStr_3777:ChatHistoryBuffer;
        private var _SafeStr_3779:ChatFlowStage;
        private var _SafeStr_3780:ChatHistoryScrollView;
        private var _chatHistoryPulldown:ChatHistoryTray;
        private var _SafeStr_3781:ChatFlowViewer;
        private var _SafeStr_3782:ChatViewController;
        private var _SafeStr_3774:ChatBubbleFactory;
        private var _SafeStr_3773:Boolean = false;
        private var _isInRoom:Boolean = false;
        private var _SafeStr_3783:_SafeStr_1626;
        private var _SafeStr_3784:Boolean = false;
        private var _SafeStr_3785:int = 1;
        private var _SafeStr_3778:Boolean = false;

        public function HabboFreeFlowChat(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public static function getTimeStampNow():String
        {
            var _local_1:Date = new Date();
            var _local_2:Number = _local_1.getHours();
            var _local_4:Number = _local_1.getMinutes();
            var _local_3:Number = _local_1.getSeconds();
            var _local_5:String = ((_local_2 < 10) ? ("0" + _local_2) : _local_2.toString());
            _local_5 = ((_local_5 + ":") + ((_local_4 < 10) ? ("0" + _local_4) : _local_4.toString()));
            _local_5 = ((_local_5 + ":") + ((_local_3 < 10) ? ("0" + _local_3) : _local_3.toString()));
            return (_local_5);
        }

        public static function create9SliceSprite(_arg_1:Rectangle, _arg_2:BitmapData):Sprite
        {
            var _local_8:int;
            var _local_5:Number;
            var _local_9:int;
            var _local_7:Sprite = new Sprite();
            var _local_3:Array = [_arg_1.left, _arg_1.right, _arg_2.width];
            var _local_4:Array = [_arg_1.top, _arg_1.bottom, _arg_2.height];
            _local_7.graphics.clear();
            var _local_6:* = 0;
            _local_8 = 0;
            while (_local_8 < 3)
            {
                _local_5 = 0;
                _local_9 = 0;
                while (_local_9 < 3)
                {
                    _local_7.graphics.beginBitmapFill(_arg_2);
                    _local_7.graphics.drawRect(_local_6, _local_5, (_local_3[_local_8] - _local_6), (_local_4[_local_9] - _local_5));
                    _local_7.graphics.endFill();
                    _local_5 = _local_4[_local_9];
                    _local_9++;
                };
                _local_6 = _local_3[_local_8];
                _local_8++;
            };
            _local_7.scale9Grid = _arg_1;
            return (_local_7);
        }


        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }, false), new ComponentDependency(new IIDAvatarRenderManager(), function (_arg_1:_SafeStr_1701):void
            {
                _avatarRenderManager = _arg_1;
            }, false), new ComponentDependency(new IIDHabboRoomSessionManager(), function (_arg_1:IRoomSessionManager):void
            {
                _roomSessionManager = _arg_1;
            }), new ComponentDependency(new IIDRoomEngine(), function (_arg_1:IRoomEngine):void
            {
                _roomEngine = _arg_1;
            }, false), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communication = _arg_1;
            }), new ComponentDependency(new IIDHabboNavigator(), function (_arg_1:_SafeStr_1696):void
            {
                _navigator = _arg_1;
            }, false), new ComponentDependency(new IIDHabboModeration(), function (_arg_1:IHabboModeration):void
            {
                _moderation = _arg_1;
            }, false), new ComponentDependency(new IIDHabboRoomUI(), function (_arg_1:IRoomUI):void
            {
                _roomUI = _arg_1;
            }, false), new ComponentDependency(new IIDHabboGameManager(), function (_arg_1:_SafeStr_1699):void
            {
                _gameManager = _arg_1;
            }, false), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localizationManager = _arg_1;
            }, false), new ComponentDependency(new IIDHabboToolbar(), function (_arg_1:IHabboToolbar):void
            {
                _toolbar = _arg_1;
            }, false), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }, false)]));
        }

        override protected function initComponent():void
        {
            _communication.addHabboConnectionMessageEvent(new _SafeStr_484(onRoomEnter));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_779(onPerkAllowances));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_843(onGuestRoomData));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_214(onAccountPreferences));
            _communication.addHabboConnectionMessageEvent(new _SafeStr_715(onRoomChatSettings));
        }

        private function onPerkAllowances(_arg_1:_SafeStr_779):void
        {
            var _local_2:Boolean = _SafeStr_3773;
            _SafeStr_3773 = true;
            if (((!(_local_2)) && (_SafeStr_3773)))
            {
                _SafeStr_3774 = new ChatBubbleFactory(this);
                if (!isDisabledInPreferences)
                {
                    _SafeStr_3775 = new ChatEventHandler(this);
                    _SafeStr_3776 = new RoomSessionEventHandler(this);
                    _SafeStr_3777 = new ChatHistoryBuffer(this);
                };
                if (_isInRoom)
                {
                    roomEntered();
                };
            }
            else
            {
                if (((_local_2) && (!(_SafeStr_3773))))
                {
                    if (_SafeStr_3774)
                    {
                        _SafeStr_3774.dispose();
                        _SafeStr_3774 = null;
                    };
                    if (_SafeStr_3775)
                    {
                        _SafeStr_3775.dispose();
                        _SafeStr_3775 = null;
                    };
                    if (_SafeStr_3776)
                    {
                        _SafeStr_3776.dispose();
                        _SafeStr_3776 = null;
                    };
                    if (_SafeStr_3777)
                    {
                        _SafeStr_3777.dispose();
                        _SafeStr_3777 = null;
                    };
                    roomLeft();
                };
            };
        }

        private function onGuestRoomData(_arg_1:_SafeStr_843):void
        {
            if (((_SafeStr_3777) && (!(_SafeStr_3778))))
            {
                _SafeStr_3777.insertRoomChange(_arg_1.getParser().data);
            };
            _SafeStr_3778 = true;
            _SafeStr_3783 = _arg_1.getParser().chatSettings;
            if (_SafeStr_3779)
            {
                _SafeStr_3779.refreshSettings();
            };
        }

        private function onRoomEnter(_arg_1:_SafeStr_484):void
        {
            _SafeStr_3778 = false;
            clear();
        }

        private function onRoomChatSettings(_arg_1:_SafeStr_715):void
        {
            _SafeStr_3783 = _arg_1.getParser().chatSettings;
            if (((_isInRoom) && (_SafeStr_3779)))
            {
                _SafeStr_3779.refreshSettings();
            };
        }

        private function onAccountPreferences(_arg_1:_SafeStr_214):void
        {
            _SafeStr_3784 = _arg_1.getParser().freeFlowChatDisabled;
            _SafeStr_3785 = _arg_1.getParser().preferedChatStyle;
        }

        public function getRoomChangeBitmap():BitmapData
        {
            return (BitmapData(assets.getAssetByName("room_change").content));
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return (_roomSessionManager);
        }

        public function get roomEngine():IRoomEngine
        {
            return (_roomEngine);
        }

        public function get avatarRenderManager():_SafeStr_1701
        {
            return (_avatarRenderManager);
        }

        public function get gameManager():_SafeStr_1699
        {
            return (_gameManager);
        }

        public function get localizations():_SafeStr_18
        {
            return (_localizationManager);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function roomEntered():void
        {
            _isInRoom = true;
            if (((((_SafeStr_3773) && (_SafeStr_3774)) && (_SafeStr_3775)) && (_SafeStr_3776)))
            {
                _SafeStr_3779 = new ChatFlowStage(this);
                _SafeStr_3781 = new ChatFlowViewer(this, _SafeStr_3779);
                _SafeStr_3780 = new ChatHistoryScrollView(this, _SafeStr_3777);
                _chatHistoryPulldown = new ChatHistoryTray(this, _SafeStr_3780);
                _SafeStr_3782 = new ChatViewController(this, _SafeStr_3781, _chatHistoryPulldown);
            };
        }

        public function roomLeft():void
        {
            if (_chatHistoryPulldown)
            {
                _chatHistoryPulldown.dispose();
                _chatHistoryPulldown = null;
            };
            if (_SafeStr_3780)
            {
                _SafeStr_3780.dispose();
                _chatHistoryPulldown = null;
            };
            if (_SafeStr_3781)
            {
                _SafeStr_3781.dispose();
                _SafeStr_3781 = null;
            };
            if (_SafeStr_3779)
            {
                _SafeStr_3779.dispose();
                _SafeStr_3779 = null;
            };
            if (_SafeStr_3782)
            {
                _SafeStr_3782.dispose();
                _SafeStr_3782 = null;
            };
            _isInRoom = false;
        }

        public function insertChat(_arg_1:ChatItem):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (((((!(_SafeStr_3773)) || (!(_SafeStr_3777))) || (!(_SafeStr_3779))) || (isDisabledInPreferences)))
            {
                return;
            };
            _SafeStr_3777.insertChat(_arg_1);
            try
            {
                _local_2 = _SafeStr_3774.getNewChatBubble(_arg_1);
            }
            catch(e:Error)
            {
                if (e.errorID == 2015)
                {
                    return;
                };
                throw (e);
            };
            _local_3 = _SafeStr_3779.insertBubble(_local_2);
            _SafeStr_3781.insertBubble(_local_2, _local_3);
        }

        public function getScreenPointFromRoomLocation(_arg_1:int, _arg_2:IVector3d):Point
        {
            var _local_9:* = null;
            var _local_5:* = null;
            if ((((_roomEngine == null) || (_SafeStr_3781 == null)) || (_SafeStr_3781.rootDisplayObject.stage == null)))
            {
                return (new Point(0, 0));
            };
            var _local_3:int = ((HabboComponentFlags.isRoomViewerMode(flags)) ? 1 : -1);
            var _local_8:IRoomGeometry = roomEngine.getRoomCanvasGeometry(_arg_1, _local_3);
            var _local_7:Number = roomEngine.getRoomCanvasScale(_arg_1);
            var _local_6:Number = ((_SafeStr_3781.rootDisplayObject.stage.stageWidth * _local_7) / 2);
            var _local_4:Number = ((_SafeStr_3781.rootDisplayObject.stage.stageHeight * _local_7) / 2);
            if (((!(_local_8 == null)) && (!(_arg_2 == null))))
            {
                _local_9 = _local_8.getScreenPoint(_arg_2);
                if (_local_9 != null)
                {
                    _local_6 = (_local_6 + (_local_9.x * _local_7));
                    _local_4 = (_local_4 + (_local_9.y * _local_7));
                    _local_5 = roomEngine.getRoomCanvasScreenOffset(_arg_1);
                    if (_local_5 != null)
                    {
                        _local_6 = (_local_6 + _local_5.x);
                        _local_4 = (_local_4 + _local_5.y);
                    };
                };
            };
            return (new Point(_local_6, _local_4));
        }

        public function get chatFlowViewer():ChatFlowViewer
        {
            return (_SafeStr_3781);
        }

        public function get chatBubbleFactory():ChatBubbleFactory
        {
            return (_SafeStr_3774);
        }

        public function get chatHistoryScrollView():ChatHistoryScrollView
        {
            return (_SafeStr_3780);
        }

        public function get displayObject():DisplayObject
        {
            if (_SafeStr_3782)
            {
                return (_SafeStr_3782.rootDisplayObject);
            };
            return (null);
        }

        public function disableRoomMouseEventsLeftOfX(_arg_1:int):void
        {
            _roomEngine.mouseEventsDisabledLeftToX = _arg_1;
        }

        public function selectAvatarWithChatItem(_arg_1:ChatItem):void
        {
            selectAvatar(_arg_1.roomId, _arg_1.userId);
        }

        public function selectAvatar(_arg_1:int, _arg_2:int):void
        {
            var _local_5:* = null;
            var _local_4:* = null;
            if (_roomUI == null)
            {
                return;
            };
            var _local_3:IRoomDesktop = _roomUI.getDesktop("hard_coded_room_id");
            _local_3.processWidgetMessage(new RoomWidgetRoomObjectMessage("RWROM_GET_OBJECT_INFO", _arg_2, 100));
            roomEngine.selectAvatar(_arg_1, _arg_2);
            var _local_6:IRoomSession = _roomSessionManager.getSession(_arg_1);
            if (_local_6)
            {
                _local_5 = _local_6.userDataManager.getUserDataByIndex(_arg_2);
                if (_local_5 != null)
                {
                    _local_4 = _roomSessionManager.getSession(_arg_1).userDataManager.getUserDataByIndex(_arg_2);
                    if (((_local_4) && (_moderation)))
                    {
                        _moderation.userSelected(_local_5.webID, _local_4.name);
                    };
                };
            };
        }

        public function get roomChatSettings():_SafeStr_1626
        {
            return (_SafeStr_3783);
        }

        public function get roomChatBorderLimited():Boolean
        {
            if (_SafeStr_3783)
            {
                return (_SafeStr_3783.mode == 1);
            };
            return (false);
        }

        public function clickHasToPropagate(_arg_1:MouseEvent):Boolean
        {
            return ((_roomUI) ? _roomUI.mouseEventPositionHasContextMenu(_arg_1) : false);
        }

        public function get chatStyleLibrary():_SafeStr_3260
        {
            return ((_SafeStr_3774) ? _SafeStr_3774.chatStyleLibrary : null);
        }

        public function get isDisabledInPreferences():Boolean
        {
            return (_SafeStr_3784);
        }

        public function set isDisabledInPreferences(_arg_1:Boolean):void
        {
            _SafeStr_3784 = _arg_1;
            _communication.connection.send(new _SafeStr_204(_SafeStr_3784));
        }

        public function get preferedChatStyle():int
        {
            return (_SafeStr_3785);
        }

        public function set preferedChatStyle(_arg_1:int):void
        {
            _SafeStr_3785 = _arg_1;
            _communication.connection.send(new _SafeStr_151(_SafeStr_3785));
        }

        public function clear():void
        {
            if (_SafeStr_3779)
            {
                _SafeStr_3779.clear();
            };
        }

        public function toggleVisibility():void
        {
            if ((((isDisabledInPreferences) || (!(_SafeStr_3773))) || (!(_chatHistoryPulldown))))
            {
                return;
            };
            _chatHistoryPulldown.toggleHistoryVisibility();
        }

        public function get toolbar():IHabboToolbar
        {
            return (_toolbar);
        }


    }
}//package com.sulake.habbo.freeflowchat

// _SafeStr_151 = "_-I6" (String#30651, DoABC#4)
// _SafeStr_1626 = "_-51" (String#28491, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_1699 = "_-uf" (String#3285, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1703 = "_-Q1U" (String#4333, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_204 = "_-Lm" (String#30002, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_214 = "_-h1u" (String#5767, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_3260 = "_-K5" (String#11133, DoABC#4)
// _SafeStr_3773 = "_-22a" (String#8624, DoABC#4)
// _SafeStr_3774 = "_-225" (String#4437, DoABC#4)
// _SafeStr_3775 = "_-a1c" (String#6846, DoABC#4)
// _SafeStr_3776 = "_-3Z" (String#8787, DoABC#4)
// _SafeStr_3777 = "_-Vt" (String#6395, DoABC#4)
// _SafeStr_3778 = "_-83" (String#12854, DoABC#4)
// _SafeStr_3779 = "_-JE" (String#3505, DoABC#4)
// _SafeStr_3780 = "_-11V" (String#10776, DoABC#4)
// _SafeStr_3781 = "_-mX" (String#5484, DoABC#4)
// _SafeStr_3782 = "_-PG" (String#7992, DoABC#4)
// _SafeStr_3783 = "_-91c" (String#8870, DoABC#4)
// _SafeStr_3784 = "_-4j" (String#11013, DoABC#4)
// _SafeStr_3785 = "_-T1l" (String#11198, DoABC#4)
// _SafeStr_484 = "_-4N" (String#2464, DoABC#4)
// _SafeStr_715 = "_-2a" (String#23860, DoABC#4)
// _SafeStr_779 = "_-s1X" (String#3814, DoABC#4)
// _SafeStr_843 = "_-W1I" (String#3535, DoABC#4)


