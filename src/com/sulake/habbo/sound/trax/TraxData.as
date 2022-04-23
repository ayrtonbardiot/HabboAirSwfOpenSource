// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.sound.trax.TraxData

package com.sulake.habbo.sound.trax
{
    import com.sulake.core.utils._SafeStr_24;

    public class TraxData 
    {

        private var _channels:Array;
        private var _SafeStr_5194:_SafeStr_24 = new _SafeStr_24();

        public function TraxData(_arg_1:String)
        {
            var _local_8:* = null;
            var _local_11:* = null;
            var _local_9:int;
            var _local_15:* = null;
            var _local_14:* = null;
            var _local_6:int;
            var _local_16:int;
            var _local_2:* = null;
            var _local_5:* = null;
            var _local_7:int;
            var _local_13:* = null;
            var _local_4:int;
            var _local_3:int;
            super();
            _channels = [];
            var _local_12:Array = _arg_1.split(":");
            var _local_10:String = String(_local_12[(_local_12.length - 1)]);
            if (_local_10.indexOf("meta") != -1)
            {
                _local_11 = _local_10.split(";");
                _local_9 = 0;
                while (_local_9 < _local_11.length)
                {
                    _local_15 = _local_11[_local_9].split(",")[0];
                    _local_14 = _local_11[_local_9].split(",")[1];
                    _SafeStr_5194.add(_local_15, _local_14);
                    _local_9++;
                };
                _local_8 = _local_12.slice(0, (_local_12.length - 1));
            }
            else
            {
                _local_8 = _local_12;
            };
            _local_6 = 0;
            while (_local_6 < (_local_8.length / 2))
            {
                if (_local_8[(_local_6 * 2)].toString().length > 0)
                {
                    _local_16 = _local_8[(_local_6 * 2)];
                    _local_2 = _local_8[((_local_6 * 2) + 1)].toString().split(";");
                    _local_5 = new TraxChannel(_local_16);
                    _local_7 = 0;
                    while (_local_7 < _local_2.length)
                    {
                        _local_13 = _local_2[_local_7].toString().split(",");
                        if (_local_13.length != 2)
                        {
                            _SafeStr_14.log("Trax load error: invalid song data string");
                            return;
                        };
                        _local_4 = _local_13[0];
                        _local_3 = _local_13[1];
                        _local_5.addChannelItem(new TraxChannelItem(_local_4, _local_3));
                        _local_7++;
                    };
                    _channels.push(_local_5);
                };
                _local_6++;
            };
        }

        public function get channels():Array
        {
            return (_channels);
        }

        public function getSampleIds():Array
        {
            var _local_4:int;
            var _local_3:* = null;
            var _local_5:int;
            var _local_2:* = null;
            var _local_1:Array = [];
            _local_4 = 0;
            while (_local_4 < _channels.length)
            {
                _local_3 = (_channels[_local_4] as TraxChannel);
                _local_5 = 0;
                while (_local_5 < _local_3.itemCount)
                {
                    _local_2 = _local_3.getItem(_local_5);
                    if (_local_1.indexOf(_local_2.id) == -1)
                    {
                        _local_1.push(_local_2.id);
                    };
                    _local_5++;
                };
                _local_4++;
            };
            return (_local_1);
        }

        public function get hasMetaData():Boolean
        {
            return (!(_SafeStr_5194["meta"] == null));
        }

        public function get metaCutMode():Boolean
        {
            return (_SafeStr_5194["c"] == "1");
        }

        public function get metaTempo():int
        {
            return (_SafeStr_5194["t"] as int);
        }


    }
}//package com.sulake.habbo.sound.trax

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_5194 = "_-D18" (String#10517, DoABC#4)


