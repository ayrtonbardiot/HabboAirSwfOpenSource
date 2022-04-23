// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.RoomSessionManager

package com.sulake.habbo.session
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.freeflowchat._SafeStr_1703;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboFreeFlowChat;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDRoomEngine;
    import __AS3__.vec.Vector;
    import _-Ol._SafeStr_902;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.session.handler.RoomSessionHandler;
    import com.sulake.habbo.session.handler.RoomChatHandler;
    import com.sulake.habbo.session.handler.RoomUsersHandler;
    import com.sulake.habbo.session.handler.RoomPermissionsHandler;
    import com.sulake.habbo.session.handler.AvatarEffectsHandler;
    import com.sulake.habbo.session.handler.RoomDataHandler;
    import com.sulake.habbo.session.handler.PresentHandler;
    import com.sulake.habbo.session.handler.GenericErrorHandler;
    import com.sulake.habbo.session.handler.PollHandler;
    import com.sulake.habbo.session.handler.WordQuizHandler;
    import com.sulake.habbo.session.handler.RoomDimmerPresetsHandler;
    import com.sulake.habbo.session.handler.PetPackageHandler;
    import com.sulake.room.utils.Vector3d;
    import flash.geom.Point;
    import flash.events.Event;
    import _-Ik._SafeStr_556;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.session.handler.BaseHandler;
    import com.sulake.iid.*;

    public class RoomSessionManager extends _SafeStr_20 implements IRoomSessionManager, IRoomHandlerListener 
    {

        public static const _SafeStr_8305:uint = 2;
        public static const SETUP_WITHOUT_TRACKING:uint = 3;
        public static const _SafeStr_8926:uint = 4;

        private var _communication:_SafeStr_25 = null;
        private var _handlers:Array = null;
        private var _SafeStr_3930:Boolean = false;
        private var _SafeStr_3933:_SafeStr_24 = null;
        private var _SafeStr_3934:RoomSession;
        private var _SafeStr_3931:Boolean = false;
        private var _habboTracking:_SafeStr_1704;
        private var _roomEngine:IRoomEngine;
        private var _freeFlowChat:_SafeStr_1703;
        private var _SafeStr_3935:Boolean;
        private var _SafeStr_3932:Boolean;
        private var _SafeStr_3936:Array;
        private var _viewerSession:RoomSession;

        public function RoomSessionManager(_arg_1:_SafeStr_31, _arg_2:uint=0)
        {
            super(_arg_1, _arg_2);
            _SafeStr_3932 = (!((_arg_2 & 0x01) == 0));
            _handlers = [];
            _SafeStr_3933 = new _SafeStr_24();
        }

        public function get initialized():Boolean
        {
            return ((allRequiredDependenciesInjected) && (_SafeStr_3930));
        }

        public function get sessionStarting():Boolean
        {
            return (_SafeStr_3931);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communication = _arg_1;
            }, ((flags & 0x02) == 0)), new ComponentDependency(new IIDHabboTracking(), function (_arg_1:_SafeStr_1704):void
            {
                _habboTracking = _arg_1;
            }, ((flags & 0x03) == 0)), new ComponentDependency(new IIDHabboFreeFlowChat(), function (_arg_1:_SafeStr_1703):void
            {
                _freeFlowChat = _arg_1;
            }, false), new ComponentDependency(new IIDHabboConfigurationManager(), null), new ComponentDependency(new IIDRoomEngine(), function (_arg_1:IRoomEngine):void
            {
                _roomEngine = _arg_1;
            }, ((flags & 0x04) == 0), [{
                "type":"REE_ENGINE_INITIALIZED",
                "callback":onRoomEngineInitialized
            }])]));
        }

        override protected function initComponent():void
        {
            createHandlers();
            if (((_SafeStr_3932) && (!(_communication == null))))
            {
                _communication.addHabboConnectionMessageEvent(new _SafeStr_902(onRoomVisualizationSettings));
            };
            executePendingSessionRequest();
        }

        override public function dispose():void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:int;
            var _local_1:* = null;
            if (disposed)
            {
                return;
            };
            if (_SafeStr_3933)
            {
                while (_SafeStr_3933.length > 0)
                {
                    _local_4 = (_SafeStr_3933.getKey(0) as String);
                    _local_2 = (_SafeStr_3933.remove(_local_4) as RoomSession);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    };
                };
                _SafeStr_3933.dispose();
                _SafeStr_3933 = null;
            };
            if (_handlers)
            {
                _local_3 = 0;
                while (_local_3 < _handlers.length)
                {
                    _local_1 = (_handlers[_local_3] as _SafeStr_13);
                    if (_local_1)
                    {
                        _local_1.dispose();
                    };
                    _local_3++;
                };
                _handlers = null;
            };
            super.dispose();
        }

        private function onRoomEngineInitialized(_arg_1:RoomEngineEvent):void
        {
            _SafeStr_3930 = true;
            executePendingSessionRequest();
        }

        private function createHandlers():void
        {
            var _local_1:* = null;
            if (_communication)
            {
                _local_1 = _communication.connection;
                _handlers.push(new RoomSessionHandler(_local_1, this));
                _handlers.push(new RoomChatHandler(_local_1, this));
                _handlers.push(new RoomUsersHandler(_local_1, this));
                _handlers.push(new RoomPermissionsHandler(_local_1, this));
                _handlers.push(new AvatarEffectsHandler(_local_1, this));
                _handlers.push(new RoomDataHandler(_local_1, this));
                _handlers.push(new PresentHandler(_local_1, this));
                _handlers.push(new GenericErrorHandler(_local_1, this));
                _handlers.push(new PollHandler(_local_1, this));
                _handlers.push(new WordQuizHandler(_local_1, this));
                _handlers.push(new RoomDimmerPresetsHandler(_local_1, this));
                _handlers.push(new PetPackageHandler(_local_1, this));
            };
        }

        private function executePendingSessionRequest():void
        {
            if (((initialized) && (!(_SafeStr_3934 == null))))
            {
                createSession(_SafeStr_3934);
                _SafeStr_3934 = null;
            };
        }

        private function onRoomVisualizationSettings(_arg_1:_SafeStr_902):void
        {
            var _local_3:int;
            var _local_8:int;
            var _local_2:int;
            var _local_6:int;
            var _local_9:int;
            var _local_4:* = null;
            var _local_7:* = null;
            if (((_SafeStr_3935) || (!(_SafeStr_3932))))
            {
                return;
            };
            _SafeStr_3935 = true;
            var _local_5:IRoomSession = getSession(0);
            if (_local_5 != null)
            {
                _local_3 = 1;
                _local_8 = 2;
                _local_2 = 2;
                _local_6 = 0x0400;
                _local_9 = 0x0300;
                _local_4 = _roomEngine.createRoomCanvas(_local_5.roomId, _local_3, _local_6, _local_9, 64);
                if (_local_4 != null)
                {
                    context.displayObjectContainer.addChild(_local_4);
                    context.displayObjectContainer.addEventListener("resize", onResize);
                    _roomEngine.setRoomCanvasMask(_local_5.roomId, _local_3, true);
                    _local_7 = _roomEngine.getRoomCanvasGeometry(_local_5.roomId, _local_3);
                    if (_local_7 != null)
                    {
                        _local_7.adjustLocation(new Vector3d(_local_8, _local_2, 0), 30);
                    };
                    _roomEngine.setRoomCanvasScreenOffset(_local_5.roomId, _local_3, new Point(0, -400));
                };
                if (((!(_freeFlowChat == null)) && (_freeFlowChat.displayObject)))
                {
                    context.displayObjectContainer.addChild(_freeFlowChat.displayObject);
                };
            };
        }

        private function onResize(_arg_1:Event):void
        {
            if (!_SafeStr_3932)
            {
                return;
            };
            var _local_2:IRoomSession = getSession(0);
            if (_local_2 == null)
            {
                return;
            };
            _roomEngine.modifyRoomCanvas(_local_2.roomId, 1, context.displayObjectContainer.width, context.displayObjectContainer.height);
        }

        public function gotoRoom(_arg_1:int, _arg_2:String="", _arg_3:String=""):Boolean
        {
            var _local_4:RoomSession = new RoomSession();
            _local_4.roomId = _arg_1;
            _local_4.roomPassword = _arg_2;
            _local_4.roomResources = _arg_3;
            _local_4.habboTracking = _habboTracking;
            return (createSession(_local_4));
        }

        public function gotoRoomNetwork(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:RoomSession = new RoomSession();
            _local_3.roomId = 1;
            _local_3.roomPassword = "";
            _local_3.habboTracking = _habboTracking;
            _local_3.openConnectionComposer = new _SafeStr_556(_arg_1, _arg_2);
            return (createSession(_local_3));
        }

        private function createSession(_arg_1:RoomSession):Boolean
        {
            if (!initialized)
            {
                _SafeStr_14.log(((("[RoomSessionManager] Not initialized, crating pending session for room: " + _arg_1.roomId) + ". Room Engine Initialized: ") + _SafeStr_3930));
                _SafeStr_3934 = _arg_1;
                return (false);
            };
            var _local_2:String = getRoomIdentifier(_arg_1.roomId);
            _SafeStr_3931 = true;
            if (_SafeStr_3933.getValue(_local_2) != null)
            {
                disposeSession(_arg_1.roomId, false);
            };
            _arg_1.connection = ((_communication) ? _communication.connection : null);
            _SafeStr_3933.add(_local_2, _arg_1);
            events.dispatchEvent(new RoomSessionEvent("RSE_CREATED", _arg_1));
            if (_SafeStr_3932)
            {
                _roomEngine.events.addEventListener("RCLE_SUCCESS", onRoomContentLoaded);
                _SafeStr_3936 = [];
                _viewerSession = _arg_1;
                if (_SafeStr_3936.length == 0)
                {
                    startSession(_arg_1);
                };
            };
            return (true);
        }

        private function onRoomContentLoaded(_arg_1:Event):void
        {
            if (((_SafeStr_3936 == null) || (_SafeStr_3936.length == 0)))
            {
                return;
            };
            var _local_2:int = _SafeStr_3936.indexOf(_arg_1["contentType"]);
            if (_local_2 != -1)
            {
                _SafeStr_3936.splice(_local_2, 1);
            };
            if (_SafeStr_3936.length == 0)
            {
                startSession(_viewerSession);
            };
        }

        public function startSession(_arg_1:IRoomSession):Boolean
        {
            if (_arg_1.state == "RSE_STARTED")
            {
                return (false);
            };
            if (_arg_1.isGameSession)
            {
                return (true);
            };
            if (_arg_1.start())
            {
                _SafeStr_3931 = false;
                events.dispatchEvent(new RoomSessionEvent("RSE_STARTED", _arg_1));
                updateHandlers(_arg_1);
            }
            else
            {
                disposeSession(_arg_1.roomId);
                _SafeStr_3931 = false;
                return (false);
            };
            return (true);
        }

        public function startGameSession():void
        {
            var _local_1:RoomSession = new RoomSession();
            _local_1.roomId = 1;
            _local_1.habboTracking = _habboTracking;
            _local_1.isGameSession = true;
            _local_1.connection = _communication.connection;
            _SafeStr_3933.add(getRoomIdentifier(_local_1.roomId), _local_1);
            events.dispatchEvent(new RoomSessionEvent("RSE_CREATED", _local_1));
        }

        public function disposeGameSession():void
        {
            var _local_2:String = getRoomIdentifier(1);
            var _local_1:RoomSession = _SafeStr_3933.getValue(_local_2);
            if (((_local_1) && (_local_1.isGameSession)))
            {
                disposeSession(1, false);
            };
        }

        public function sessionUpdate(_arg_1:int, _arg_2:String):void
        {
            var _local_3:IRoomSession = getSession(_arg_1);
            if (_local_3 != null)
            {
                switch (_arg_2)
                {
                    case "RS_CONNECTED":
                        return;
                    case "RS_READY":
                        return;
                    case "RS_DISCONNECTED":
                        disposeSession(_arg_1);
                        return;
                };
            };
        }

        public function sessionReinitialize(_arg_1:int, _arg_2:int):void
        {
            var _local_4:* = null;
            var _local_5:String = getRoomIdentifier(_arg_1);
            var _local_3:RoomSession = (_SafeStr_3933.remove(_local_5) as RoomSession);
            if (_local_3 != null)
            {
                _local_3.reset(_arg_2);
                _local_5 = getRoomIdentifier(_arg_2);
                _local_4 = _SafeStr_3933.remove(_local_5);
                if (_local_4 != null)
                {
                };
                _SafeStr_3933.add(_local_5, _local_3);
                updateHandlers(_local_3);
            };
        }

        public function getSession(_arg_1:int):IRoomSession
        {
            var _local_2:String = getRoomIdentifier(_arg_1);
            return (_SafeStr_3933.getValue(_local_2) as IRoomSession);
        }

        public function disposeSession(_arg_1:int, _arg_2:Boolean=true):void
        {
            var _local_4:String = getRoomIdentifier(_arg_1);
            var _local_3:RoomSession = (_SafeStr_3933.remove(_local_4) as RoomSession);
            if (_local_3 != null)
            {
                events.dispatchEvent(new RoomSessionEvent("RSE_ENDED", _local_3, _arg_2));
                _local_3.dispose();
            };
        }

        private function updateHandlers(_arg_1:IRoomSession):void
        {
            var _local_3:int;
            var _local_2:* = null;
            if (((!(_arg_1 == null)) && (!(_handlers == null))))
            {
                _local_3 = 0;
                while (_local_3 < _handlers.length)
                {
                    _local_2 = (_handlers[_local_3] as BaseHandler);
                    if (_local_2 != null)
                    {
                        _local_2._SafeStr_3937 = _arg_1.roomId;
                    };
                    _local_3++;
                };
            };
        }

        private function getRoomIdentifier(_arg_1:int):String
        {
            return ("hard_coded_room_id");
        }


    }
}//package com.sulake.habbo.session

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1703 = "_-Q1U" (String#4333, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3930 = "_-4J" (String#14977, DoABC#4)
// _SafeStr_3931 = "_-C9" (String#9271, DoABC#4)
// _SafeStr_3932 = "_-C1t" (String#11235, DoABC#4)
// _SafeStr_3933 = "_-s1P" (String#4035, DoABC#4)
// _SafeStr_3934 = "_-81K" (String#10309, DoABC#4)
// _SafeStr_3935 = "_-Yi" (String#19261, DoABC#4)
// _SafeStr_3936 = "_-Kd" (String#4174, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)
// _SafeStr_556 = "_-y1t" (String#29613, DoABC#4)
// _SafeStr_8305 = "_-CT" (String#22470, DoABC#4)
// _SafeStr_8926 = "_-b15" (String#37404, DoABC#4)
// _SafeStr_902 = "_-K18" (String#6992, DoABC#4)


