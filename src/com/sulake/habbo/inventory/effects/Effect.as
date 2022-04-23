// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.inventory.effects.Effect

package com.sulake.habbo.inventory.effects
{
    import com.sulake.habbo.ui.widget.memenu._SafeStr_3271;
    import com.sulake.habbo.inventory.IThumbListDrawableItem;
    import com.sulake.habbo.avatar._SafeStr_3339;
    import com.sulake.habbo.inventory._SafeStr_3123;
    import flash.display.BitmapData;

    public class Effect implements _SafeStr_3271, IThumbListDrawableItem, _SafeStr_3339, _SafeStr_3123 
    {

        private var _SafeStr_4028:int;
        private var _SafeStr_6046:int;
        private var _duration:int;
        private var _SafeStr_6047:int = 1;
        private var _SafeStr_6049:int;
        private var _SafeStr_6048:Boolean = false;
        private var _SafeStr_4495:Boolean = false;
        private var _SafeStr_4617:Boolean = false;
        private var _SafeStr_4616:Boolean = false;
        private var _SafeStr_5214:BitmapData;
        private var _SafeStr_6050:Date;


        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get subType():int
        {
            return (_SafeStr_6046);
        }

        public function get duration():int
        {
            return (_duration);
        }

        public function get amountInInventory():int
        {
            return (_SafeStr_6047);
        }

        public function get isPermanent():Boolean
        {
            return (_SafeStr_6048);
        }

        public function get isActive():Boolean
        {
            return (_SafeStr_4495);
        }

        public function get isInUse():Boolean
        {
            return (_SafeStr_4616);
        }

        public function get isSelected():Boolean
        {
            return (_SafeStr_4617);
        }

        public function get icon():BitmapData
        {
            return (_SafeStr_5214);
        }

        public function get iconImage():BitmapData
        {
            return (_SafeStr_5214);
        }

        public function get secondsLeft():int
        {
            var _local_1:int;
            if (_SafeStr_4495)
            {
                _local_1 = int((_SafeStr_6049 - ((new Date().valueOf() - _SafeStr_6050.valueOf()) / 1000)));
                _local_1 = Math.floor(_local_1);
                if (_local_1 < 0)
                {
                    _local_1 = 0;
                };
                return (_local_1);
            };
            return (_SafeStr_6049);
        }

        public function set type(_arg_1:int):void
        {
            _SafeStr_4028 = _arg_1;
        }

        public function set subType(_arg_1:int):void
        {
            _SafeStr_6046 = _arg_1;
        }

        public function set duration(_arg_1:int):void
        {
            _duration = _arg_1;
        }

        public function set secondsLeft(_arg_1:int):void
        {
            _SafeStr_6049 = _arg_1;
        }

        public function set isPermanent(_arg_1:Boolean):void
        {
            _SafeStr_6048 = _arg_1;
        }

        public function set isSelected(_arg_1:Boolean):void
        {
            _SafeStr_4617 = _arg_1;
        }

        public function set isInUse(_arg_1:Boolean):void
        {
            _SafeStr_4616 = _arg_1;
        }

        public function set iconImage(_arg_1:BitmapData):void
        {
            _SafeStr_5214 = _arg_1;
        }

        public function set amountInInventory(_arg_1:int):void
        {
            _SafeStr_6047 = _arg_1;
        }

        public function set isActive(_arg_1:Boolean):void
        {
            if (((_arg_1) && (!(_SafeStr_4495))))
            {
                _SafeStr_6050 = new Date();
            };
            _SafeStr_4495 = _arg_1;
        }

        public function setOneEffectExpired():void
        {
            _SafeStr_6047--;
            if (_SafeStr_6047 < 0)
            {
                _SafeStr_6047 = 0;
            };
            _SafeStr_6049 = _duration;
            _SafeStr_4495 = false;
            _SafeStr_4616 = false;
        }


    }
}//package com.sulake.habbo.inventory.effects

// _SafeStr_3123 = "_-k1o" (String#7780, DoABC#4)
// _SafeStr_3271 = "_-z1P" (String#7829, DoABC#4)
// _SafeStr_3339 = "_-y1N" (String#5817, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4495 = "_-b12" (String#2547, DoABC#4)
// _SafeStr_4616 = "_-L1v" (String#7703, DoABC#4)
// _SafeStr_4617 = "_-229" (String#2305, DoABC#4)
// _SafeStr_5214 = "_-D1k" (String#2378, DoABC#4)
// _SafeStr_6046 = "_-913" (String#19675, DoABC#4)
// _SafeStr_6047 = "_-nM" (String#7650, DoABC#4)
// _SafeStr_6048 = "_-Vc" (String#19197, DoABC#4)
// _SafeStr_6049 = "_-tL" (String#11271, DoABC#4)
// _SafeStr_6050 = "_-c1J" (String#17822, DoABC#4)


