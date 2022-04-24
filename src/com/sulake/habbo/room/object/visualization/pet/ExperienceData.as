// by nota

//com.sulake.habbo.room.object.visualization.pet.ExperienceData

package com.sulake.habbo.room.object.visualization.pet
{
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.text.TextFormat;
    import flash.text.TextField;
    import flash.geom.Matrix;

    public class ExperienceData 
    {

        private var _SafeStr_5234:BitmapData;
        private var _SafeStr_6170:Boolean;
        private var _SafeStr_6169:BitmapData;
        private var _amount:int = -1;
        private var _alpha:int;

        public function ExperienceData(_arg_1:BitmapData, _arg_2:Boolean=true)
        {
            _SafeStr_5234 = _arg_1;
            _SafeStr_6170 = _arg_2;
            if (_SafeStr_5234 != null)
            {
                _SafeStr_6169 = _SafeStr_5234.clone();
            };
            setExperience(0);
        }

        public function dispose():void
        {
            if (_SafeStr_6169)
            {
                _SafeStr_6169.dispose();
                _SafeStr_6169 = null;
            };
            if (_SafeStr_5234 != null)
            {
                if (_SafeStr_6170)
                {
                    _SafeStr_5234.dispose();
                };
                _SafeStr_5234 = null;
            };
        }

        public function get alpha():int
        {
            return (_alpha);
        }

        public function set alpha(_arg_1:int):void
        {
            _alpha = _arg_1;
        }

        public function get image():BitmapData
        {
            return (_SafeStr_5234);
        }

        public function setExperience(_arg_1:int):void
        {
            if (((_amount == _arg_1) || (_SafeStr_5234 == null)))
            {
                return;
            };
            _SafeStr_5234.copyPixels(_SafeStr_6169, _SafeStr_6169.rect, new Point(0, 0));
            var _local_2:TextFormat = new TextFormat();
            _local_2.font = "Volter";
            _local_2.color = 0xFFFFFF;
            _local_2.size = 9;
            var _local_3:TextField = new TextField();
            _local_3.embedFonts = true;
            _local_3.width = 30;
            _local_3.height = 12;
            _local_3.background = true;
            _local_3.backgroundColor = 0xE6C0B500;
            _local_3.defaultTextFormat = _local_2;
            _local_3.text = ("+" + _arg_1);
            var _local_4:Matrix = new Matrix();
            _local_4.translate(15, 19);
            _SafeStr_5234.draw(_local_3, _local_4);
        }


    }
}//package com.sulake.habbo.room.object.visualization.pet

// _SafeStr_5234 = "_-gu" (String#735, DoABC#4)
// _SafeStr_6169 = "_-125" (String#7888, DoABC#4)
// _SafeStr_6170 = "_-Hd" (String#18832, DoABC#4)


