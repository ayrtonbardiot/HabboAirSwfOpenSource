// by nota

//com.sulake.habbo.communication.HabboCommunicationManager

package com.sulake.habbo.communication
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.communication.connection._SafeStr_26;
    import com.sulake.core.communication._SafeStr_46;
    import com.sulake.core.communication.messages.IMessageConfiguration;
    import flash.utils.Timer;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDCoreCommunicationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import __AS3__.vec.Vector;
    import flash.events.Event;
    import com.sulake.core._SafeStr_79;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.communication.encryption.ArcFour;
    import com.sulake.core.communication.encryption.IEncryption;
    import com.sulake.habbo.communication.encryption.DiffieHellman;
    import com.hurlant.math.BigInteger;
    import com.sulake.core.communication.handshake.IKeyExchange;
    import _-g18._SafeStr_44;
    import flash.events.IOErrorEvent;
    import flash.events.TimerEvent;
    import flash.events.SecurityErrorEvent;

    public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, _SafeStr_26 
    {

        private static const DEFAULT_CONNECTION_ATTEMPTS:int = 2;

        private var _communication:_SafeStr_46;
        private var _SafeStr_5642:IMessageConfiguration = new HabboMessages();
        private var _SafeStr_8485:String = "";
        private var _SafeStr_8486:Array = [];
        private var _SafeStr_8487:int = -1;
        private var _SafeStr_8488:Timer = new Timer(100, 1);
        private var _SafeStr_8489:int = 1;
        private var _SafeStr_8490:String = "";
        private var _SafeStr_8491:Boolean = false;
        private var _SafeStr_8492:Boolean = false;
        private var _a4:Array = [65191, 65178, 65178, 65177, 65185];
        private var _webApiSession:IHabboWebApiSession;
        private var _connection:IConnection;
        private var _SafeStr_3771:int = 0;
        private var _requiresInitialRetryAttempt:Boolean = true;

        public function HabboCommunicationManager(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _arg_1.events.addEventListener("unload", unloading);
        }

        private static function getKeyValue(_arg_1:Array, _arg_2:int):String
        {
            var _local_5:String = "";
            for each (var _local_3:Array in _arg_1)
            {
                for each (var _local_4:int in _local_3)
                {
                    _local_5 = (_local_5 + String.fromCharCode(((65290 - _local_4) + _arg_2--)));
                };
            };
            return (_local_5);
        }


        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDCoreCommunicationManager(), function (_arg_1:_SafeStr_46):void
            {
                _communication = _arg_1;
            }), new ComponentDependency(new IIDHabboConfigurationManager(), null, false, [{
                "type":"complete",
                "callback":onConfigurationComplete
            }])]));
        }

        private function onAuthenticated(_arg_1:Event):void
        {
            _connection.isAuthenticated();
        }

        private function onConfigurationComplete(_arg_1:Event):void
        {
            _connection.isConfigured();
        }

        public function disconnect():void
        {
            if (_connection)
            {
                _connection.close();
            };
        }

        public function get connection():IConnection
        {
            return (_connection);
        }

        public function get mode():int
        {
            return (0);
        }

        public function set mode(_arg_1:int):void
        {
            _SafeStr_3771 = _arg_1;
        }

        public function get port():int
        {
            if ((((_SafeStr_8486.length == 0) || (_SafeStr_8487 < 0)) || (_SafeStr_8487 >= _SafeStr_8486.length)))
            {
                return (0);
            };
            return (_SafeStr_8486[_SafeStr_8487]);
        }

        override protected function initComponent():void
        {
            context.events.addEventListener("HABBO_CONNECTION_EVENT_AUTHENTICATED", onAuthenticated);
            _connection = _communication.createConnection(this);
            _connection.registerMessageClasses(_SafeStr_5642);
            _connection.addListener("ioError", onIOError);
            _connection.addListener("securityError", onSecurityError);
            _connection.addListener("connect", onConnect);
            updateHostParameters();
            if (_SafeStr_8492)
            {
                nextPort();
            };
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_connection)
            {
                _connection.dispose();
                _connection = null;
            };
            if (_webApiSession)
            {
                _webApiSession.dispose();
                _webApiSession = null;
            };
            super.dispose();
        }

        public function updateHostParameters():void
        {
            var _local_6:* = null;
            var _local_4:* = null;
            var _local_7:int;
            var _local_10:Array = [65162, 65162, 65158, 65155];
            var _local_9:Array = [65234, 65174, 65168, 65175, 65165, 65229];
            var _local_2:Array = [65170, 65162, 65157, 65155];
            var _local_1:Array = [65186, 65168, 65178, 65171, 65171];
            var _local_5:String = getProperty(getKeyValue([_a4, _local_1, _local_9, _local_2], 0), null);
            if (_local_5 == null)
            {
                _SafeStr_79.crash(getKeyValue([_a4, _local_1, _local_9, _local_2], 0), 30);
                return;
            };
            _local_4 = [];
            _local_7 = 1;
            while (_local_7 < 5)
            {
                _local_5 = _local_5.substring(0, (_local_5.length - _local_7));
                switch (_local_7)
                {
                    case 3:
                        _local_4.push(_local_9);
                        break;
                    case 2:
                        _local_4.push(_local_1);
                        break;
                    case 4:
                        _local_4.push(_local_10);
                        break;
                    case 1:
                        _local_4.push(_a4);
                    default:
                };
                _local_7++;
            };
            _local_6 = getProperty(getKeyValue(_local_4, 0), null);
            if (_local_6 == null)
            {
                _SafeStr_79.crash(getKeyValue([_a4, _local_1, _local_9, _local_10], 0), 30);
                return;
            };
            _SafeStr_8486 = [];
            var _local_8:Array = _local_6.split(",");
            for each (var _local_3:String in _local_8)
            {
                _SafeStr_8486.push(parseInt(_local_3.replace(" ", "")));
            };
            _SafeStr_8485 = _local_5;
        }

        public function renewSocket():void
        {
            _SafeStr_8489 = 1;
            _requiresInitialRetryAttempt = true;
            if (_connection != null)
            {
                _connection.createSocket();
            };
        }

        public function initConnection(_arg_1:String):void
        {
            switch (_arg_1)
            {
                case "habbo":
                    if (_connection == null)
                    {
                        _SafeStr_79.crash("Tried to connect to proxy but connection was null", 30);
                        return;
                    };
                    _SafeStr_8492 = true;
                    if (allRequiredDependenciesInjected)
                    {
                        nextPort();
                    };
                    return;
                default:
                    return;
            };
        }

        public function addHabboConnectionMessageEvent(_arg_1:IMessageEvent):IMessageEvent
        {
            if (_connection)
            {
                _connection.addMessageEvent(_arg_1);
            };
            return (_arg_1);
        }

        public function removeHabboConnectionMessageEvent(_arg_1:IMessageEvent):void
        {
            if (_connection)
            {
                _connection.removeMessageEvent(_arg_1);
            };
        }

        public function connectionInit(_arg_1:String, _arg_2:int):void
        {
            ErrorReportStorage.setParameter("host", _arg_1);
            ErrorReportStorage.setParameter("port", String(_arg_2));
        }

        public function messageReceived(_arg_1:String):void
        {
            ErrorReportStorage.setParameter("rece_msg_time", new Date().getTime());
            if (_SafeStr_8490.length > 0)
            {
                _SafeStr_8490 = (_SafeStr_8490 + (",R:" + _arg_1));
            }
            else
            {
                _SafeStr_8490 = ("R:" + _arg_1);
            };
            if (_SafeStr_8490.length > 150)
            {
                _SafeStr_8490 = _SafeStr_8490.substring((_SafeStr_8490.length - 150));
            };
        }

        public function messageSent(_arg_1:String):void
        {
            ErrorReportStorage.setParameter("sent_msg_time", new Date().getTime());
            if (_SafeStr_8490.length > 0)
            {
                _SafeStr_8490 = (_SafeStr_8490 + (",S:" + _arg_1));
            }
            else
            {
                _SafeStr_8490 = ("S:" + _arg_1);
            };
            if (_SafeStr_8490.length > 150)
            {
                _SafeStr_8490 = _SafeStr_8490.substring((_SafeStr_8490.length - 150));
            };
        }

        public function messageParseError(_arg_1:IMessageDataWrapper):void
        {
            ErrorReportStorage.setParameter("sent_msg_data", (_arg_1 as Object).toString());
            ErrorReportStorage.addDebugData("MESSAGE_QUEUE", _SafeStr_8490);
        }

        public function setMessageQueueErrorDebugData():void
        {
            ErrorReportStorage.addDebugData("MESSAGE_QUEUE", _SafeStr_8490);
        }

        public function initializeEncryption():IEncryption
        {
            return (new ArcFour());
        }

        public function initializeKeyExchange(_arg_1:BigInteger, _arg_2:BigInteger):IKeyExchange
        {
            return (new DiffieHellman(_arg_1, _arg_2));
        }

        private function nextPort():void
        {
            var _local_1:int;
            if (!_connection)
            {
                return;
            };
            if (_connection.connected)
            {
                return;
            };
            _SafeStr_8487++;
            if (_SafeStr_8487 >= _SafeStr_8486.length)
            {
                ErrorReportStorage.addDebugData("ConnectionRetry", ("Connection attempt " + _SafeStr_8489));
                _SafeStr_8489++;
                _local_1 = 2;
                if (_SafeStr_8486.length == 1)
                {
                    _local_1++;
                };
                if (_SafeStr_8489 <= _local_1)
                {
                    _SafeStr_8487 = 0;
                }
                else
                {
                    if (_SafeStr_8491)
                    {
                        return;
                    };
                    _SafeStr_8491 = true;
                    _SafeStr_79.error("Connection failed to host and ports", true, 30);
                    return;
                };
            };
            _connection.timeout = (_SafeStr_8489 * 10000);
            _connection.init((_SafeStr_8485 + getKeyValue([[65244, 65185, 65191, 65189, 65188], [65174, 65238, 65184], [65171, 65172]], 0)), _SafeStr_8486[_SafeStr_8487]);
            if (_requiresInitialRetryAttempt)
            {
                _SafeStr_8487--;
                _requiresInitialRetryAttempt = false;
            };
        }

        private function tryNextPort():void
        {
            _SafeStr_8488.addEventListener("timer", onTryNextPort);
            _SafeStr_8488.start();
        }

        private function unloading(_arg_1:Event):void
        {
            if (_connection)
            {
                _connection.send(new _SafeStr_44());
            };
        }

        private function onIOError(_arg_1:IOErrorEvent):void
        {
            switch (_arg_1.type)
            {
                case "ioError":
                    break;
                case "diskError":
                    break;
                case "networkError":
                    break;
                case "verifyError":
            };
            ErrorReportStorage.addDebugData("Communication IO Error", ((((("IOError " + _arg_1.type) + " on connect: ") + _arg_1.text) + ". Port was ") + _SafeStr_8486[_SafeStr_8487]));
            tryNextPort();
        }

        private function onConnect(_arg_1:Event):void
        {
            ErrorReportStorage.addDebugData("Connection", (("Connected with " + _SafeStr_8489) + " attempts"));
        }

        private function onTryNextPort(_arg_1:TimerEvent):void
        {
            nextPort();
        }

        private function onSecurityError(_arg_1:SecurityErrorEvent):void
        {
            ErrorReportStorage.addDebugData("Communication Security Error", ((("SecurityError on connect: " + _arg_1.text) + ". Port was ") + _SafeStr_8486[_SafeStr_8487]));
            tryNextPort();
        }

        public function createHabboWebApiSession(_arg_1:_SafeStr_33, _arg_2:String):IHabboWebApiSession
        {
            if (_webApiSession != null)
            {
                resetHabboWebApiSession();
            };
            var _local_3:HabboWebApiSession = new HabboWebApiSession(_arg_2);
            _local_3.addListener(_arg_1);
            _webApiSession = _local_3;
            events.dispatchEvent(new Event("HABBO_POCKET_SESSION_CREATED"));
            return (_local_3);
        }

        public function getHabboWebApiSession():IHabboWebApiSession
        {
            return (_webApiSession);
        }

        public function resetHabboWebApiSession():void
        {
            if (_webApiSession)
            {
                _webApiSession.dispose();
                _webApiSession = null;
            };
        }


    }
}//package com.sulake.habbo.communication

// _SafeStr_20 = "_-W1o" (String#8724, DoABC#3)
// _SafeStr_21 = "_-61a" (String#6965, DoABC#3)
// _SafeStr_25 = "_-G19" (String#7587, DoABC#3)
// _SafeStr_26 = "_-91n" (String#7173, DoABC#3)
// _SafeStr_31 = "_-Ee" (String#7513, DoABC#3)
// _SafeStr_33 = "_-dW" (String#9241, DoABC#3)
// _SafeStr_3771 = "_-9Y" (String#7196, DoABC#3)
// _SafeStr_38 = "_-xv" (String#10574, DoABC#3)
// _SafeStr_42 = "_-mU" (String#9831, DoABC#3)
// _SafeStr_44 = "_-Q1w" (String#8303, DoABC#3)
// _SafeStr_46 = "_-fk" (String#9374, DoABC#3)
// _SafeStr_5642 = "_-oE" (String#9948, DoABC#3)
// _SafeStr_79 = "_-411" (String#6798, DoABC#3)
// _SafeStr_8485 = "_-g1a" (String#9400, DoABC#3)
// _SafeStr_8486 = "_-Yk" (String#8878, DoABC#3)
// _SafeStr_8487 = "_-l1C" (String#9737, DoABC#3)
// _SafeStr_8488 = "_-oh" (String#9959, DoABC#3)
// _SafeStr_8489 = "_-01n" (String#6491, DoABC#3)
// _SafeStr_8490 = "_-lz" (String#9789, DoABC#3)
// _SafeStr_8491 = "_-a1z" (String#8994, DoABC#3)
// _SafeStr_8492 = "_-V1A" (String#8604, DoABC#3)


