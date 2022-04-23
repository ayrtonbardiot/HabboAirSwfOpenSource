// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.demo._SafeStr_3118

package com.sulake.habbo.communication.demo
{
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.core.communication.handshake._SafeStr_42;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.hurlant.crypto.rsa.RSAKey;
    import com.sulake.core.communication.connection.IConnection;
    import _-yL._SafeStr_274;
    import _-yL._SafeStr_1033;
    import _-a5._SafeStr_1014;
    import _-yL._SafeStr_133;
    import _-yL._SafeStr_459;
    import _-ps._SafeStr_226;
    import _-yL._SafeStr_251;
    import _-a5._SafeStr_1021;
    import _-yL._SafeStr_993;
    import _-yL._SafeStr_461;
    import _-yL._SafeStr_218;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import com.sulake.core.communication.encryption.CryptoTools;
    import com.hurlant.math.BigInteger;
    import com.sulake.core._SafeStr_79;
    import _-g18._SafeStr_371;
    import com.sulake.core.communication.encryption.IEncryption;
    import _-g18._SafeStr_790;
    import _-qv._SafeStr_895;
    import _-Z1K._SafeStr_1428;
    import _-K1r._SafeStr_1282;
    import _-g18._SafeStr_357;
    import com.sulake.habbo.utils.CommunicationUtils;
    import com.sulake.habbo.communication.login.AvatarData;
    import flash.utils.Dictionary;
    import _-C1D._SafeStr_1249;
    import _-g18._SafeStr_475;
    import _-g18._SafeStr_588;
    import _-Z1K._SafeStr_1134;
    import com.sulake.habbo.utils.HabboWebTools;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.communication.demo.utils._SafeStr_3298;
    import com.sulake.habbo.communication.demo.utils._SafeStr_3364;

    [SecureSWF(rename="true")]
    public class _SafeStr_3118 
    {

        private var _SafeStr_4147:_SafeStr_2027;
        private var _communication:_SafeStr_25;
        private var _SafeStr_5118:_SafeStr_42;
        private var _privateKey:String;
        private var _SafeStr_5119:Boolean;
        private var _SafeStr_5120:Boolean;
        private var _messageEvents:Vector.<IMessageEvent> = new Vector.<IMessageEvent>(0);
        private var _rsa:RSAKey;

        public function _SafeStr_3118(_arg_1:_SafeStr_2027, _arg_2:_SafeStr_25)
        {
            _SafeStr_4147 = _arg_1;
            _communication = _arg_2;
            var _local_3:IConnection = _communication.connection;
            if (_local_3 == null)
            {
                throw (new Error("Connection is required to initialize!"));
            };
            _local_3.addEventListener("connect", onConnectionEstablished);
            _local_3.addEventListener("close", onConnectionDisconnected);
            addHabboConnectionMessageEvent(new _SafeStr_274(onDisconnectReason));
            addHabboConnectionMessageEvent(new _SafeStr_1033(onIdentityAccounts));
            addHabboConnectionMessageEvent(new _SafeStr_1014(onLoginFailedHotelClosed));
            addHabboConnectionMessageEvent(new _SafeStr_133(onInitDiffieHandshake));
            addHabboConnectionMessageEvent(new _SafeStr_459(onAuthenticationOK));
            addHabboConnectionMessageEvent(new _SafeStr_226(onErrorReport));
            addHabboConnectionMessageEvent(new _SafeStr_251(onPing));
            addHabboConnectionMessageEvent(new _SafeStr_1021(onMaintenance));
            addHabboConnectionMessageEvent(new _SafeStr_993(onCompleteDiffieHandshake));
            addHabboConnectionMessageEvent(new _SafeStr_461(onGenericError));
            addHabboConnectionMessageEvent(new _SafeStr_218(onUniqueMachineId));
            _SafeStr_4147.context.events.addEventListener("unload", unloading);
        }

        private static function setReasonProperty(_arg_1:String, _arg_2:String):String
        {
            if (_arg_1.indexOf("%reason%") != -1)
            {
                return (_arg_1.replace("%reason%", _arg_2));
            };
            return (_arg_1);
        }


        public function dispose():void
        {
            var _local_1:* = null;
            if (_communication)
            {
                _local_1 = _communication.connection;
                if (_local_1 != null)
                {
                    _local_1.removeEventListener("connect", onConnectionEstablished);
                    _local_1.removeEventListener("close", onConnectionDisconnected);
                };
                for each (var _local_2:IMessageEvent in _messageEvents)
                {
                    _communication.removeHabboConnectionMessageEvent(_local_2);
                };
                _messageEvents = new Vector.<IMessageEvent>(0);
            };
            _SafeStr_4147 = null;
            _communication = null;
            _SafeStr_5118 = null;
        }

        private function addHabboConnectionMessageEvent(_arg_1:IMessageEvent):void
        {
            _communication.addHabboConnectionMessageEvent(_arg_1);
            _messageEvents.push(_arg_1);
        }

        private function unloading(_arg_1:Event):void
        {
            _SafeStr_5120 = true;
        }

        private function onInitDiffieHandshake(_arg_1:IMessageEvent):void
        {
            var _local_9:* = null;
            var _local_16:IConnection = _arg_1.connection;
            var _local_2:_SafeStr_133 = (_arg_1 as _SafeStr_133);
            var _local_3:ByteArray = new ByteArray();
            var _local_4:ByteArray = new ByteArray();
            _local_3.writeBytes(CryptoTools.hexStringToByteArray(_local_2.encryptedPrime));
            _local_4.writeBytes(CryptoTools.hexStringToByteArray(_local_2.encryptedGenerator));
            var _local_5:ByteArray = new ByteArray();
            var _local_8:ByteArray = new ByteArray();
            _rsa = RSAKey.parsePublicKey(_SafeStr_7._SafeStr_3528(-1820302793), "10001");
            _rsa.verify(_local_3, _local_5, _local_3.length);
            _rsa.verify(_local_4, _local_8, _local_4.length);
            var _local_11:BigInteger = new BigInteger(_local_5.toString(), 10);
            var _local_12:BigInteger = new BigInteger(_local_8.toString(), 10);
            var _local_10:BigInteger = BigInteger.nbv(2);
            if (((_local_11.compareTo(_local_10) <= 0) || (_local_12.compareTo(_local_11) >= 0)))
            {
                _SafeStr_79.crash("Invalid DH prime and generator", 29);
                return;
            };
            if (_local_11.equals(_local_12))
            {
                _SafeStr_79.crash("Invalid DH prime and generator", 29);
                return;
            };
            _SafeStr_5118 = _communication.initializeKeyExchange(_local_11, _local_12);
            var _local_6:String;
            var _local_13:int = 10;
            var _local_7:String;
            while (_local_13 > 0)
            {
                _local_7 = generateRandomHexString(30);
                _SafeStr_5118.init(_local_7);
                _local_9 = _SafeStr_5118.getPublicKey(10);
                if (_local_9.length < 64)
                {
                    if (((_local_6 == null) || (_local_9.length > _local_6.length)))
                    {
                        _local_6 = _local_9;
                        _privateKey = _local_7;
                    };
                }
                else
                {
                    _local_6 = _local_9;
                    _privateKey = _local_7;
                    break;
                };
                _local_13--;
            };
            if (_local_7 != _privateKey)
            {
                _SafeStr_5118.init(_privateKey);
            };
            var _local_15:ByteArray = new ByteArray();
            var _local_14:ByteArray = new ByteArray();
            _local_15.writeMultiByte(_local_6, "iso-8859-1");
            _rsa.encrypt(_local_15, _local_14, _local_15.length);
            _local_16.sendUnencrypted(new _SafeStr_371(CryptoTools.byteArrayToHexString(_local_14)));
        }

        private function onCompleteDiffieHandshake(_arg_1:IMessageEvent):void
        {
            var _local_9:* = null;
            var _local_7:IConnection = _arg_1.connection;
            var _local_4:_SafeStr_993 = (_arg_1 as _SafeStr_993);
            var _local_6:ByteArray = new ByteArray();
            var _local_3:ByteArray = new ByteArray();
            _local_6.writeBytes(CryptoTools.hexStringToByteArray(_local_4.encryptedPublicKey));
            _rsa.verify(_local_6, _local_3, _local_6.length);
            _rsa.dispose();
            _SafeStr_5118.generateSharedKey(_local_3.toString(), 10);
            var _local_2:String = _SafeStr_5118.getSharedKey(16).toUpperCase();
            if (!_SafeStr_5118.isValidServerPublicKey())
            {
                return;
            };
            var _local_8:ByteArray = CryptoTools.hexStringToByteArray(_local_2);
            _local_8.position = 0;
            var _local_5:IEncryption = _communication.initializeEncryption();
            _local_5.init(_local_8);
            if (_local_4.serverClientEncryption)
            {
                _local_9 = _communication.initializeEncryption();
                _local_9.init(_local_8);
            };
            _local_7.setEncryption(_local_5, _local_9);
            _SafeStr_5119 = false;
            _SafeStr_4147.dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_HANDSHAKED");
            _SafeStr_4147.sendConnectionParameters(_local_7);
        }

        private function onAuthenticationOK(_arg_1:IMessageEvent):void
        {
            var _local_4:IConnection = _arg_1.connection;
            _SafeStr_4147.dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_AUTHENTICATED");
            var _local_2:_SafeStr_790 = new _SafeStr_790();
            _local_4.send(_local_2);
            var _local_3:_SafeStr_895 = new _SafeStr_895("Login", "socket", "client.auth_ok");
            _local_4.send(_local_3);
            _SafeStr_4147.loginOk();
        }

        private function onLoginFailedHotelClosed(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1428 = (_arg_1 as _SafeStr_1014).getParser();
            _SafeStr_4147.handleLoginFailedHotelClosedMessage(_local_2.openHour, _local_2.openMinute);
        }

        private function onGenericError(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1282 = (_arg_1 as _SafeStr_461).getParser();
            switch (_local_2.errorCode)
            {
                case -3:
                    _SafeStr_4147.alert("${connection.error.id.title}", "${connection.login.error.-3.desc}");
                    return;
                case -400:
                    _SafeStr_4147.alert("${connection.error.id.title}", "${connection.login.error.-400.desc}");
                    return;
            };
        }

        private function onPing(_arg_1:IMessageEvent):void
        {
            var _local_2:IConnection = _arg_1.connection;
            var _local_3:_SafeStr_357 = new _SafeStr_357();
            _local_2.send(_local_3);
        }

        [SecureSWF(controlFlow="0", codeWrap="off")]
        private function onUniqueMachineId(_arg_1:_SafeStr_218):void
        {
            CommunicationUtils.writeSOLProperty("machineid", _arg_1.machineID);
        }

        private function onIdentityAccounts(_arg_1:_SafeStr_1033):void
        {
            var _local_3:* = null;
            var _local_6:* = null;
            var _local_4:Vector.<AvatarData> = new Vector.<AvatarData>(0);
            var _local_2:Dictionary = _arg_1.getParser().accounts;
            for (var _local_5:String in _local_2)
            {
                _local_3 = _local_2[_local_5];
                _local_6 = new AvatarData(null);
                _local_6.id = parseInt(_local_5);
                _local_6.name = _local_3;
                _local_4.push(_local_6);
            };
            _SafeStr_4147.onUserList(_local_4);
        }

        private function onErrorReport(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1249 = (_arg_1 as _SafeStr_226).getParser();
            var _local_3:int = _local_2.errorCode;
            var _local_4:int = _local_2.messageId;
            _SafeStr_4147.handleErrorMessage(_local_3, _local_4);
        }

        private function onConnectionEstablished(_arg_1:Event=null):void
        {
            var _local_2:IConnection = _communication.connection;
            if (_local_2 != null)
            {
                updateRsaData();
                _SafeStr_4147.dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_ESTABLISHED");
                _SafeStr_5120 = false;
                _SafeStr_5119 = true;
                _SafeStr_4147.dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_HANDSHAKING");
                _local_2.sendUnencrypted(new _SafeStr_475());
                _local_2.sendUnencrypted(new _SafeStr_588());
            };
        }

        private function onMaintenance(_arg_1:_SafeStr_1021):void
        {
            var _local_2:_SafeStr_1134 = (_arg_1.parser as _SafeStr_1134);
            _SafeStr_14.log(("Got maintenance status, with minutes left: " + _local_2.minutesUntilMaintenance.toString()));
            _SafeStr_4147.localization.registerParameter("disconnected.maintenance_status", "%minutes%", _local_2.minutesUntilMaintenance.toString());
            var _local_3:String = _SafeStr_4147.localization.getLocalization("disconnected.maintenance_status");
            _SafeStr_4147.disconnected(-2, _local_3);
        }

        private function onDisconnectReason(_arg_1:_SafeStr_274):void
        {
            if (_SafeStr_5119)
            {
                _SafeStr_4147.dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL");
            };
            _SafeStr_14.log(("[HabboLogin] Got disconnect reason: " + _arg_1.reason));
            _SafeStr_4147.disconnected(_arg_1.reason, _arg_1.getReasonName());
            _SafeStr_5119 = false;
            _SafeStr_5120 = true;
        }

        private function handleWebLogout(_arg_1:_SafeStr_274):void
        {
            var _local_2:String = _SafeStr_4147.getProperty("logout.url");
            if (_local_2.length > 0)
            {
                _local_2 = setReasonProperty(_local_2, _arg_1.reasonString);
                _local_2 = setOriginProperty(_local_2);
                _local_2 = (_local_2 + ("&id=" + _arg_1.reason));
                if (_SafeStr_4147.context.configuration.getInteger("spaweb", 0) == 1)
                {
                    HabboWebTools.sendDisconnectToWeb(_arg_1.reason, _arg_1.reasonString);
                }
                else
                {
                    HabboWebTools.openWebPage(_local_2, "_self");
                };
            };
        }

        private function setOriginProperty(_arg_1:String):String
        {
            if (_arg_1.indexOf("%origin%") != -1)
            {
                return (_arg_1.replace("%origin%", _SafeStr_4147.getProperty("flash.client.origin")));
            };
            return (_arg_1);
        }

        private function onConnectionDisconnected(_arg_1:Event):void
        {
            var _local_2:* = null;
            if (_SafeStr_4147.isRoomViewerMode)
            {
                return;
            };
            if (_SafeStr_5119)
            {
                _SafeStr_4147.dispatchLoginStepEvent("HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL");
            };
            if (ExternalInterface.available)
            {
                ExternalInterface.call("FlashExternalInterface.logDisconnection", "Communication failure, client disconnected.");
                if (((_arg_1.type == "close") && (!(_SafeStr_5120))))
                {
                    _local_2 = _SafeStr_4147.getProperty("logout.disconnect.url");
                    _local_2 = setOriginProperty(_local_2);
                    if (_SafeStr_4147.context.configuration.getInteger("spaweb", 0) == 1)
                    {
                        HabboWebTools.sendDisconnectToWeb(-1, "HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL");
                    }
                    else
                    {
                        HabboWebTools.openWebPage(_local_2, "_self");
                    };
                };
            };
            if (((_arg_1.type == "close") && (!(_SafeStr_5120))))
            {
                _SafeStr_4147.disconnected(-3, "");
            };
        }

        private function generateRandomHexString(_arg_1:uint=16):String
        {
            var _local_4:int;
            var _local_3:uint;
            var _local_2:String = "";
            _local_4 = 0;
            while (_local_4 < _arg_1)
            {
                _local_3 = uint((Math.random() * 0xFF));
                _local_2 = (_local_2 + _local_3.toString(16));
                _local_4++;
            };
            return (_local_2);
        }

        public function updateRsaData():void
        {
            var _local_5:String = "xIBlMDUyODA4YzFhYmVmNjlhMWE2MmMzOTYzOTZiODU5NTVlMmZmNTIyZjUxNTc2MzlmYTZhMTlhOThiNTRlMGU0ZDZlNDRmNDRjNGMwMzkwZmVlOGNjZjY0MmEyMmI2ZDQ2ZDcyMjhiMTBlMzRhZTZmZmZiNjFhMzVjMTEzMzM3ODBhZjZkZDFhYWFmYTczODhmYTZjNjViNTFlODIyNWM2YjU3Y2Y1ZmJhYzMwODU2ZTg5NjIyOTUxMmUxZjlhZjAzNDg5NTkzN2IyY2I2NjM3ZWI2ZWRmNzY4YzEwMTg5ZGYzMGMxMGQ4YTNlYzIwNDg4YTE5ODA2MzU5OWNhNmFkBTEwMDAx";
            var _local_3:String = _SafeStr_3298.decode(_local_5);
            var _local_2:int = _local_3.charCodeAt(0);
            var _local_4:int = _local_3.charCodeAt((_local_2 + 1));
            var _local_1:Array = _SafeStr_3364.getRsaData();
            _local_1[0] = _local_3.substr(1, _local_2);
            _local_1[1] = _local_3.substr((_local_2 + 2), _local_4);
        }


    }
}//package com.sulake.habbo.communication.demo

// _SafeStr_1014 = "_-X8" (String#11765, DoABC#4)
// _SafeStr_1021 = "_-T10" (String#9490, DoABC#4)
// _SafeStr_1033 = "_-EF" (String#23843, DoABC#4)
// _SafeStr_1134 = "_-j11" (String#23169, DoABC#4)
// _SafeStr_1249 = "_-G1P" (String#39456, DoABC#4)
// _SafeStr_1282 = "_-Q5" (String#31389, DoABC#4)
// _SafeStr_133 = "_-nK" (String#17950, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1428 = "_-01D" (String#29672, DoABC#4)
// _SafeStr_2027 = "_-f1U" (String#11080, DoABC#4)
// _SafeStr_218 = "_-o1" (String#23648, DoABC#4)
// _SafeStr_226 = "_-XP" (String#24386, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_251 = "_-51Q" (String#29657, DoABC#4)
// _SafeStr_274 = "_-Kp" (String#11240, DoABC#4)
// _SafeStr_3118 = "_-wi" (String#2138, DoABC#4)
// _SafeStr_3298 = "_-99" (String#22221, DoABC#4)
// _SafeStr_3364 = "_-S1Y" (String#22027, DoABC#4)
// _SafeStr_3528 = "_a_--_--" (String#39846, DoABC#4)
// _SafeStr_357 = "_-fT" (String#24332, DoABC#4)
// _SafeStr_371 = "_-CO" (String#30088, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_42 = "_-mU" (String#32427, DoABC#4)
// _SafeStr_459 = "_-y9" (String#18590, DoABC#4)
// _SafeStr_461 = "_-Q17" (String#7013, DoABC#4)
// _SafeStr_475 = "_-c1t" (String#29475, DoABC#4)
// _SafeStr_5118 = "_-f1Q" (String#6919, DoABC#4)
// _SafeStr_5119 = "_-B1P" (String#8733, DoABC#4)
// _SafeStr_5120 = "_-J1W" (String#6242, DoABC#4)
// _SafeStr_588 = "_-T1Q" (String#28389, DoABC#4)
// _SafeStr_7 = "_a_-_---" (String#39228, DoABC#4)
// _SafeStr_79 = "_-411" (String#2835, DoABC#4)
// _SafeStr_790 = "_-KE" (String#23452, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)
// _SafeStr_993 = "_-p1i" (String#22711, DoABC#4)


