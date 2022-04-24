// by nota

//com.sulake.core.communication.connection._SafeStr_3115

package com.sulake.core.communication.connection
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime._SafeStr_13;
    import flash.net.Socket;
    import flash.utils.Timer;
    import flash.utils.ByteArray;
    import com.sulake.core.communication.wireformat._SafeStr_3311;
    import com.sulake.core.communication.encryption.IEncryption;
    import com.sulake.core.communication.messages._SafeStr_3365;
    import com.sulake.core.communication._SafeStr_46;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.core.communication.wireformat._SafeStr_3312;
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.utils.getQualifiedClassName;
    import flash.utils.getDefinitionByName;
    import com.sulake.core.utils.ClassUtils;
    import com.sulake.core.communication.messages.IPreEncryptionMessage;
    import com.sulake.core.communication.messages.IMessageConfiguration;
    import com.sulake.core._SafeStr_79;
    import flash.events.ProgressEvent;
    import com.sulake.core.utils.ErrorReportStorage;
    import flash.events.Event;
    import flash.events.SecurityErrorEvent;
    import flash.events.IOErrorEvent;
    import flash.events.TimerEvent;

    [SecureSWF(rename="true")]
    public class _SafeStr_3115 extends EventDispatcherWrapper implements IConnection, _SafeStr_13 
    {

        public static const DEFAULT_SOCKET_TIMEOUT:int = 10000;

        private var _SafeStr_4008:Socket;
        private var _SafeStr_4006:Timer;
        private var _SafeStr_4015:int;
        private var _SafeStr_4014:ByteArray;
        private var _SafeStr_4013:_SafeStr_3311;
        private var _clientToServerEncryption:IEncryption;
        private var _serverToClientEncryption:IEncryption;
        private var _SafeStr_4007:_SafeStr_3365;
        private var _communicationManager:_SafeStr_46;
        private var _SafeStr_4009:_SafeStr_26;
        private var _SafeStr_4012:Boolean;
        private var _configurationReady:Boolean;
        private var _SafeStr_4011:Vector.<IMessageComposer>;
        private var _SafeStr_4010:Vector.<IMessageDataWrapper>;
        private var _lastProcessedMessage:IMessageDataWrapper;

        public function _SafeStr_3115(_arg_1:_SafeStr_46, _arg_2:_SafeStr_26)
        {
            _communicationManager = _arg_1;
            _SafeStr_4007 = new _SafeStr_3365();
            _SafeStr_4013 = new _SafeStr_3312();
            createSocket();
            _SafeStr_4006 = new Timer(10000, 1);
            _SafeStr_4006.addEventListener("timer", onTimeOutTimer);
            _SafeStr_4009 = _arg_2;
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


        public function addListener(_arg_1:String, _arg_2:Function):void
        {
            addEventListener(_arg_1, _arg_2);
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                disposeSocket();
                if (_SafeStr_4006)
                {
                    _SafeStr_4006.stop();
                    _SafeStr_4006.removeEventListener("timer", onTimeOutTimer);
                };
                _SafeStr_4006 = null;
                _SafeStr_4014 = null;
                _SafeStr_4009 = null;
                _clientToServerEncryption = null;
                _serverToClientEncryption = null;
                _SafeStr_4013 = null;
                if (_SafeStr_4007)
                {
                    _SafeStr_4007.dispose();
                };
                _SafeStr_4007 = null;
                _communicationManager = null;
                _SafeStr_4009 = null;
                _lastProcessedMessage = null;
                super.dispose();
            };
        }

        public function createSocket():void
        {
            disposeSocket();
            _SafeStr_4014 = new ByteArray();
            _serverToClientEncryption = null;
            _clientToServerEncryption = null;
            _SafeStr_4008 = new Socket();
            _SafeStr_4008.addEventListener("connect", onConnect);
            _SafeStr_4008.addEventListener("complete", onComplete);
            _SafeStr_4008.addEventListener("close", onClose);
            _SafeStr_4008.addEventListener("socketData", onRead);
            _SafeStr_4008.addEventListener("securityError", onSecurityError);
            _SafeStr_4008.addEventListener("ioError", onIOError);
        }

        private function disposeSocket():void
        {
            if (_SafeStr_4008)
            {
                _SafeStr_4008.removeEventListener("connect", onConnect);
                _SafeStr_4008.removeEventListener("complete", onComplete);
                _SafeStr_4008.removeEventListener("close", onClose);
                _SafeStr_4008.removeEventListener("socketData", onRead);
                _SafeStr_4008.removeEventListener("securityError", onSecurityError);
                _SafeStr_4008.removeEventListener("ioError", onIOError);
                if (_SafeStr_4008.connected)
                {
                    _SafeStr_4008.close();
                };
                _SafeStr_4008 = null;
            };
        }

        [SecureSWF(controlFlow="20", codeWrap="maximum", rename="true", slr="true")]
        public function init(_arg_1:String, _arg_2:uint=0):Boolean
        {
            if (_SafeStr_4009)
            {
                _SafeStr_4009.connectionInit(_arg_1, _arg_2);
            };
            _SafeStr_4006.start();
            _SafeStr_4015 = getTimer();
            _SafeStr_4008.connect(_arg_1, _arg_2);
            return (true);
        }

        public function set timeout(_arg_1:int):void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_4006.delay = _arg_1;
        }

        public function addMessageEvent(_arg_1:IMessageEvent):void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_4007.registerMessageEvent(_arg_1);
        }

        public function removeMessageEvent(_arg_1:IMessageEvent):void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_4007.unregisterMessageEvent(_arg_1);
        }

        public function isAuthenticated():void
        {
            _SafeStr_4012 = true;
        }

        public function isConfigured():void
        {
            var _local_1:int;
            var _local_3:* = null;
            _configurationReady = true;
            if (_SafeStr_4010)
            {
                for each (var _local_4:IMessageDataWrapper in _SafeStr_4010)
                {
                    _local_1 = _local_4.getID();
                    _local_3 = parseReceivedMessage(_local_4);
                    if (_local_3 != null)
                    {
                        handleReceivedMessage(_local_1, _local_3);
                    };
                };
            };
            if (_SafeStr_4011)
            {
                for each (var _local_2:IMessageComposer in _SafeStr_4011)
                {
                    send(_local_2);
                };
                _SafeStr_4011 = null;
            };
            _SafeStr_4011 = new Vector.<IMessageComposer>(0);
            _SafeStr_4010 = new Vector.<IMessageDataWrapper>(0);
        }

        [SecureSWF(controlFlow="20", codeWrap="maximum", rename="true")]
        public function send(_arg_1:IMessageComposer):Boolean
        {
            if (disposed)
            {
                return (false);
            };
            if (((_SafeStr_4012) && (!(_configurationReady))))
            {
                if (_SafeStr_4011 == null)
                {
                    _SafeStr_4011 = new Vector.<IMessageComposer>(0);
                };
                _SafeStr_4011.push(_arg_1);
                return (false);
            };
            var _local_4:int = _SafeStr_4007.getMessageIDForComposer(_arg_1);
            if (_local_4 < 0)
            {
                return (false);
            };
            var _local_2:Array = _arg_1.getMessageArray();
            var _local_3:ByteArray = _SafeStr_4013.encode(_local_4, _local_2);
            if (_SafeStr_4009)
            {
                _SafeStr_4009.messageSent(_local_4);
            };
            if (_clientToServerEncryption == null)
            {
                return (false);
            };
            if (_SafeStr_4008.connected)
            {
                _clientToServerEncryption.encipher(_local_3);
                _SafeStr_4008.writeBytes(_local_3);
                _SafeStr_4008.flush();
            }
            else
            {
                return (false);
            };
            return (true);
        }

        [SecureSWF(controlFlow="20", codeWrap="maximum", rename="true")]
        public function sendUnencrypted(_arg_1:IMessageComposer):Boolean
        {
            if (disposed)
            {
                return (false);
            };
            var _local_4:int = _SafeStr_4007.getMessageIDForComposer(_arg_1);
            if (_local_4 < 0)
            {
                return (false);
            };
            var _local_2:Array = _arg_1.getMessageArray();
            var _local_3:ByteArray = _SafeStr_4013.encode(_local_4, _local_2);
            var _local_6:String = getQualifiedClassName(_arg_1);
            var _local_5:Class = (getDefinitionByName(_local_6) as Class);
            if (!ClassUtils.implementsInterface(_local_5, IPreEncryptionMessage))
            {
                return (false);
            };
            if (_SafeStr_4009)
            {
                _SafeStr_4009.messageSent(_local_4);
            };
            if (_SafeStr_4008.connected)
            {
                _SafeStr_4008.writeBytes(_local_3);
                _SafeStr_4008.flush();
            }
            else
            {
                return (false);
            };
            return (true);
        }

        public function setEncryption(_arg_1:IEncryption, _arg_2:IEncryption):void
        {
            _clientToServerEncryption = _arg_1;
            _serverToClientEncryption = _arg_2;
        }

        public function registerMessageClasses(_arg_1:IMessageConfiguration):void
        {
            _SafeStr_4007.registerMessages(_arg_1);
        }

        private function processData():void
        {
            var _local_1:* = null;
            var _local_2:int;
            var _local_3:* = null;
            _local_1 = splitReceivedMessages();
            for each (_lastProcessedMessage in _local_1)
            {
                _local_2 = _lastProcessedMessage.getID();
                if (_SafeStr_4009)
                {
                    _SafeStr_4009.messageReceived(_local_2);
                };
                if (((_SafeStr_4012) && (!(_configurationReady))))
                {
                    if (_SafeStr_4010 == null)
                    {
                        _SafeStr_4010 = new Vector.<IMessageDataWrapper>(0);
                    };
                    _SafeStr_4010.push(_lastProcessedMessage);
                }
                else
                {
                    _local_3 = parseReceivedMessage(_lastProcessedMessage);
                    if (_local_3 != null)
                    {
                        handleReceivedMessage(_local_2, _local_3);
                    };
                };
            };
        }

        [SecureSWF(controlFlow="0")]
        public function processReceivedData():void
        {
            if (disposed)
            {
                return;
            };
            try
            {
                processData();
            }
            catch(e:Error)
            {
                if (((_SafeStr_4009) && (_lastProcessedMessage)))
                {
                    _SafeStr_4009.messageParseError(_lastProcessedMessage);
                };
                if (!disposed)
                {
                    throw (e);
                };
            };
        }

        private function splitReceivedMessages():Array
        {
            var _local_1:* = null;
            _SafeStr_4014.position = 0;
            if (_SafeStr_4014.bytesAvailable == 0)
            {
                return ([]);
            };
            var _local_2:Array = _SafeStr_4013.splitMessages(_SafeStr_4014, this);
            if (_SafeStr_4014.bytesAvailable == 0)
            {
                _SafeStr_4014 = new ByteArray();
            }
            else
            {
                if (_SafeStr_4014.position > 0)
                {
                    _local_1 = new ByteArray();
                    _local_1.writeBytes(_SafeStr_4014, _SafeStr_4014.position);
                    _SafeStr_4014 = _local_1;
                };
            };
            return (_local_2);
        }

        private function parseReceivedMessage(_arg_1:IMessageDataWrapper):Array
        {
            var _local_2:* = null;
            var _local_3:Array = _SafeStr_4007.getMessageEventsForID(_arg_1.getID());
            if (_local_3 != null)
            {
                _local_2 = (_local_3[0] as IMessageEvent).parser;
                try
                {
                    _local_2.flush();
                    _local_2.parse(_arg_1);
                }
                catch(e:Error)
                {
                    _SafeStr_79.crash((getKeyValue([[65220, 65192, 65183, 65179], [65185, 65185, 65252, 65167], [65171, 65249, 65168, 65182], [65164, 65162, 65175, 65243], [65169, 65163, 65173, 65160], [65161, 65164, 65158, 65164], [65234, 65156, 65163, 65148], [65147, 65164, 65157, 65158], [65226, 65140, 65141, 65150, 65144, 65150]], 0) + getQualifiedClassName(_local_2)), e.errorID, e);
                };
            };
            return (_local_3);
        }

        private function handleReceivedMessage(_arg_1:int, _arg_2:Array):void
        {
            for each (var _local_3:IMessageEvent in _arg_2)
            {
                _local_3.connection = this;
                _local_3.callback.call(null, _local_3);
            };
        }

        public function get connected():Boolean
        {
            if (_SafeStr_4008 == null)
            {
                return (false);
            };
            return (_SafeStr_4008.connected);
        }

        public function close():void
        {
            if (_SafeStr_4008 == null)
            {
                return;
            };
            try
            {
                _SafeStr_4008.close();
            }
            catch(e:Error)
            {
            };
        }

        private function onRead(_arg_1:ProgressEvent):void
        {
            if (_SafeStr_4008 == null)
            {
                return;
            };
            _SafeStr_4014.position = _SafeStr_4014.length;
            _SafeStr_4008.readBytes(_SafeStr_4014, _SafeStr_4014.position);
        }

        public function getServerToClientEncryption():IEncryption
        {
            return (_serverToClientEncryption);
        }

        private function onConnect(_arg_1:Event):void
        {
            _SafeStr_4006.stop();
            ErrorReportStorage.addDebugData(getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65178], [65171, 65171, 65196, 65174], [65169, 65176, 65162]], 0), (getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65182], [65182, 65249, 65175, 65169, 65246]], 0) + (getTimer() - _SafeStr_4015)));
            dispatchEvent(_arg_1);
        }

        private function onClose(_arg_1:Event):void
        {
            _SafeStr_4006.stop();
            ErrorReportStorage.addDebugData(getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65178], [65171, 65171, 65196, 65174], [65169, 65176, 65162]], 0), (getKeyValue([[65223, 65181, 65177, 65172], [65185, 65185, 65252, 65178], [65172, 65249]], 0) + (getTimer() - _SafeStr_4015)));
            dispatchEvent(_arg_1);
        }

        private function onComplete(_arg_1:Event):void
        {
            _SafeStr_4006.stop();
            ErrorReportStorage.addDebugData(getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65178], [65171, 65171, 65196, 65174], [65169, 65176, 65162]], 0), (getKeyValue([[65223, 65178, 65179, 65175], [65178, 65184, 65168, 65182], [65182, 65249, 65175, 65169, 65246]], 0) + (getTimer() - _SafeStr_4015)));
            dispatchEvent(_arg_1);
        }

        private function onSecurityError(_arg_1:SecurityErrorEvent):void
        {
            _SafeStr_4006.stop();
            ErrorReportStorage.addDebugData(getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65178], [65171, 65171, 65196, 65174], [65169, 65176, 65162]], 0), (getKeyValue([[65207, 65188, 65189, 65170], [65172, 65180, 65168, 65162], [65213, 65167, 65166, 65168], [65164, 65245, 65171, 65165, 65242]], 0) + (getTimer() - _SafeStr_4015)));
            dispatchEvent(_arg_1);
        }

        private function onIOError(_arg_1:IOErrorEvent):void
        {
            _SafeStr_4006.stop();
            ErrorReportStorage.addDebugData(getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65178], [65171, 65171, 65196, 65174], [65169, 65176, 65162]], 0), (getKeyValue([[65217, 65210, 65219, 65173], [65172, 65174, 65170, 65251], [65177, 65171, 65248]], 0) + (getTimer() - _SafeStr_4015)));
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
            dispatchEvent(_arg_1);
        }

        private function onTimeOutTimer(_arg_1:TimerEvent):void
        {
            _SafeStr_4006.stop();
            ErrorReportStorage.addDebugData(getKeyValue([[65223, 65178, 65178, 65177], [65185, 65186, 65168, 65178], [65171, 65171, 65196, 65174], [65169, 65176, 65162]], 0), (getKeyValue([[65206, 65184, 65179, 65186], [65207, 65168, 65168, 65251], [65177, 65171, 65248, 65247]], 0) + (getTimer() - _SafeStr_4015)));
            var _local_2:IOErrorEvent = new IOErrorEvent("ioError");
            _local_2.text = ((getKeyValue([[65207, 65178, 65189, 65180], [65185, 65169, 65252, 65199], [65177, 65172, 65179, 65168], [65161, 65161, 65244, 65235]], 0) + _SafeStr_4006.delay) + getKeyValue([[65258, 65180, 65173, 65246], [65240, 65253, 65204, 65172], [65167, 65166, 65175, 65181], [65170, 65176, 65244, 65205], [65169, 65159, 65171, 65152], [65173, 65161, 65160, 65221]], 0));
            dispatchEvent(_local_2);
        }


    }
}//package com.sulake.core.communication.connection

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_26 = "_-91n" (String#25556, DoABC#4)
// _SafeStr_3115 = "_-T1Z" (String#13897, DoABC#4)
// _SafeStr_3311 = "_-1N" (String#15026, DoABC#4)
// _SafeStr_3312 = "_-L1d" (String#15125, DoABC#4)
// _SafeStr_3365 = "_-w1P" (String#12728, DoABC#4)
// _SafeStr_4006 = "_-61F" (String#4321, DoABC#4)
// _SafeStr_4007 = "_-ra" (String#5648, DoABC#4)
// _SafeStr_4008 = "_-C1I" (String#2440, DoABC#4)
// _SafeStr_4009 = "_-7N" (String#4583, DoABC#4)
// _SafeStr_4010 = "_-G1p" (String#7929, DoABC#4)
// _SafeStr_4011 = "_-B1k" (String#6611, DoABC#4)
// _SafeStr_4012 = "_-M1L" (String#15235, DoABC#4)
// _SafeStr_4013 = "_-5t" (String#9213, DoABC#4)
// _SafeStr_4014 = "_-Gw" (String#3893, DoABC#4)
// _SafeStr_4015 = "_-y1H" (String#8147, DoABC#4)
// _SafeStr_46 = "_-fk" (String#24270, DoABC#4)
// _SafeStr_79 = "_-411" (String#2835, DoABC#4)


