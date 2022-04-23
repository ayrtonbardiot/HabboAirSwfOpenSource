// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.data._SafeStr_1612

package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;
    import adobe.serialization.json.JSONDecoder;

    public class _SafeStr_1612 implements IStuffData 
    {

        private var _SafeStr_6583:int;
        private var _uniqueSerialNumber:int = 0;
        private var _SafeStr_8731:int = 0;


        public function set flags(_arg_1:int):void
        {
            _SafeStr_6583 = _arg_1;
        }

        public function initializeFromIncomingMessage(_arg_1:IMessageDataWrapper):void
        {
            if ((_SafeStr_6583 & 0x0100) > 0)
            {
                _uniqueSerialNumber = _arg_1.readInteger();
                _SafeStr_8731 = _arg_1.readInteger();
            };
        }

        public function initializeFromRoomObjectModel(_arg_1:IRoomObjectModel):void
        {
            _uniqueSerialNumber = _arg_1.getNumber("furniture_unique_serial_number");
            _SafeStr_8731 = _arg_1.getNumber("furniture_unique_edition_size");
        }

        public function writeRoomObjectModel(_arg_1:IRoomObjectModelController):void
        {
            _arg_1.setNumber("furniture_unique_serial_number", _uniqueSerialNumber);
            _arg_1.setNumber("furniture_unique_edition_size", _SafeStr_8731);
        }

        public function get uniqueSerialNumber():int
        {
            return (_uniqueSerialNumber);
        }

        public function get uniqueSeriesSize():int
        {
            return (_SafeStr_8731);
        }

        public function set uniqueSerialNumber(_arg_1:int):void
        {
            _uniqueSerialNumber = _arg_1;
        }

        public function set uniqueSeriesSize(_arg_1:int):void
        {
            _SafeStr_8731 = _arg_1;
        }

        public function getLegacyString():String
        {
            return ("");
        }

        public function compare(_arg_1:IStuffData):Boolean
        {
            return (false);
        }

        public function get rarityLevel():int
        {
            return (-1);
        }

        public function get state():int
        {
            var _local_1:Number = getLegacyString();
            return ((isNaN(_local_1)) ? -1 : _local_1);
        }

        public function getJSONValue(_arg_1:String):String
        {
            var _local_2:* = null;
            try
            {
                _local_2 = new JSONDecoder(getLegacyString(), true).getValue()[_arg_1];
                var _local_4:* = _local_2;
                return (_local_4);
            }
            catch(error:Error)
            {
                return ("");
            };
            return ("");
        }


    }
}//package com.sulake.habbo.room.object.data

// _SafeStr_1612 = "_-Nn" (String#8117, DoABC#3)
// _SafeStr_6583 = "_-61n" (String#6972, DoABC#3)
// _SafeStr_8731 = "_-mF" (String#9825, DoABC#3)


