// by nota

//com.sulake.habbo.sound.music.SongDataEntry

package com.sulake.habbo.sound.music
{
    import _-jK._SafeStr_1543;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.habbo.sound._SafeStr_3135;

    public class SongDataEntry extends _SafeStr_1543 implements ISongInfo 
    {

        private var _soundObject:_SafeStr_3135 = null;
        private var _SafeStr_6173:String;
        private var _SafeStr_6174:int = -1;

        public function SongDataEntry(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:_SafeStr_3135)
        {
            _soundObject = _arg_5;
            _SafeStr_6173 = "";
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        override public function get id():int
        {
            return (_SafeStr_4222);
        }

        override public function get length():int
        {
            return (_SafeStr_6171);
        }

        override public function get name():String
        {
            return (_songName);
        }

        override public function get creator():String
        {
            return (_SafeStr_6172);
        }

        public function get loaded():Boolean
        {
            return ((_soundObject == null) ? false : _soundObject.ready);
        }

        public function get soundObject():_SafeStr_3135
        {
            return (_soundObject);
        }

        public function get songData():String
        {
            return (_SafeStr_6173);
        }

        public function get diskId():int
        {
            return (_SafeStr_6174);
        }

        public function set soundObject(_arg_1:_SafeStr_3135):void
        {
            _soundObject = _arg_1;
        }

        public function set songData(_arg_1:String):void
        {
            _SafeStr_6173 = _arg_1;
        }

        public function set diskId(_arg_1:int):void
        {
            _SafeStr_6174 = _arg_1;
        }


    }
}//package com.sulake.habbo.sound.music

// _SafeStr_1543 = "_-L1G" (String#26541, DoABC#4)
// _SafeStr_3135 = "_-Je" (String#3060, DoABC#4)
// _SafeStr_4222 = "_-Tb" (String#2462, DoABC#4)
// _SafeStr_6171 = "_-pp" (String#32246, DoABC#4)
// _SafeStr_6172 = "_-21U" (String#34265, DoABC#4)
// _SafeStr_6173 = "_-ap" (String#12526, DoABC#4)
// _SafeStr_6174 = "_-222" (String#20334, DoABC#4)


