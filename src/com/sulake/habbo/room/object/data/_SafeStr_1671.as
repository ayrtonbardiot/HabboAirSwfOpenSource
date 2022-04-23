// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.data._SafeStr_1671

package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;

    public class _SafeStr_1671 extends _SafeStr_1612 implements IStuffData 
    {

        public static const FORMAT_KEY:int = 6;

        private var _SafeStr_3734:String = "";
        private var _SafeStr_8736:int = -1;
        private var _SafeStr_8737:int = -1;
        private var _SafeStr_5093:Vector.<HighScoreData>;


        public function get scoreType():int
        {
            return (_SafeStr_8736);
        }

        public function get clearType():int
        {
            return (_SafeStr_8737);
        }

        public function get entries():Vector.<HighScoreData>
        {
            return (_SafeStr_5093);
        }

        override public function initializeFromIncomingMessage(_arg_1:IMessageDataWrapper):void
        {
            var _local_5:int;
            var _local_2:* = null;
            var _local_4:int;
            var _local_6:int;
            _SafeStr_5093 = new Vector.<HighScoreData>();
            _SafeStr_3734 = _arg_1.readString();
            _SafeStr_8736 = _arg_1.readInteger();
            _SafeStr_8737 = _arg_1.readInteger();
            var _local_3:int = _arg_1.readInteger();
            _local_5 = 0;
            while (_local_5 < _local_3)
            {
                _local_2 = new HighScoreData();
                _local_2.score = _arg_1.readInteger();
                _local_4 = _arg_1.readInteger();
                _local_6 = 0;
                while (_local_6 < _local_4)
                {
                    _local_2.addUser(_arg_1.readString());
                    _local_6++;
                };
                _SafeStr_5093.push(_local_2);
                _local_5++;
            };
        }

        override public function initializeFromRoomObjectModel(_arg_1:IRoomObjectModel):void
        {
            var _local_4:int;
            var _local_2:* = null;
            _SafeStr_5093 = new Vector.<HighScoreData>();
            super.initializeFromRoomObjectModel(_arg_1);
            _SafeStr_8736 = _arg_1.getNumber("furniture_highscore_score_type");
            _SafeStr_8737 = _arg_1.getNumber("furniture_highscore_clear_type");
            var _local_3:int = _arg_1.getNumber("furniture_highscore_data_entry_count");
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = new HighScoreData();
                _local_2.score = _arg_1.getNumber(("furniture_highscore_data_entry_base_score_" + _local_4));
                _local_2.users = _arg_1.getStringArray(("furniture_highscore_data_entry_base_users_" + _local_4));
                _SafeStr_5093.push(_local_2);
                _local_4++;
            };
        }

        override public function writeRoomObjectModel(_arg_1:IRoomObjectModelController):void
        {
            var _local_3:int;
            var _local_2:* = null;
            super.writeRoomObjectModel(_arg_1);
            _arg_1.setNumber("furniture_data_format", 6);
            _arg_1.setNumber("furniture_highscore_score_type", _SafeStr_8736);
            _arg_1.setNumber("furniture_highscore_clear_type", _SafeStr_8737);
            if (_SafeStr_5093)
            {
                _arg_1.setNumber("furniture_highscore_data_entry_count", _SafeStr_5093.length);
                _local_3 = 0;
                while (_local_3 < _SafeStr_5093.length)
                {
                    _local_2 = _SafeStr_5093[_local_3];
                    _arg_1.setNumber(("furniture_highscore_data_entry_base_score_" + _local_3), _local_2.score);
                    _arg_1.setStringArray(("furniture_highscore_data_entry_base_users_" + _local_3), _local_2.users);
                    _local_3++;
                };
            };
        }

        override public function getLegacyString():String
        {
            return (_SafeStr_3734);
        }


    }
}//package com.sulake.habbo.room.object.data

// _SafeStr_1612 = "_-Nn" (String#8117, DoABC#3)
// _SafeStr_1671 = "_-D1S" (String#7423, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_5093 = "_-Pc" (String#8270, DoABC#3)
// _SafeStr_8736 = "_-EP" (String#7509, DoABC#3)
// _SafeStr_8737 = "_-Le" (String#7982, DoABC#3)


