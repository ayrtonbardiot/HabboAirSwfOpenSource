// by nota

//com.sulake.habbo.groups.badge.BadgeLayerOptions

package com.sulake.habbo.groups.badge
{
    public class BadgeLayerOptions 
    {

        private var _SafeStr_6661:int = -1;
        private var _SafeStr_6568:int = -1;
        private var _SafeStr_6704:int = -1;
        private var _SafeStr_6705:int = -1;
        private var _SafeStr_6706:int = -1;


        public function setGrid(_arg_1:int):void
        {
            _SafeStr_6705 = Math.floor((_arg_1 % 3));
            _SafeStr_6706 = Math.floor((_arg_1 / 3));
        }

        public function clone():BadgeLayerOptions
        {
            var _local_1:BadgeLayerOptions = new BadgeLayerOptions();
            _local_1._SafeStr_6661 = _SafeStr_6661;
            _local_1._SafeStr_6568 = _SafeStr_6568;
            _local_1._SafeStr_6704 = _SafeStr_6704;
            _local_1._SafeStr_6705 = _SafeStr_6705;
            _local_1._SafeStr_6706 = _SafeStr_6706;
            return (_local_1);
        }

        public function equalVisuals(_arg_1:BadgeLayerOptions):Boolean
        {
            if (((((_arg_1 == null) || (!(_SafeStr_6705 == _arg_1.gridX))) || (!(_SafeStr_6706 == _arg_1.gridY))) || (!(_SafeStr_6704 == _arg_1.colorIndex))))
            {
                return (false);
            };
            if ((((_SafeStr_6661 == 0) && (!(_arg_1.layerIndex == 0))) || ((!(_SafeStr_6661 == 0)) && (_arg_1.layerIndex == 0))))
            {
                return (false);
            };
            return (true);
        }

        public function isGridEqual(_arg_1:BadgeLayerOptions):Boolean
        {
            if (((_arg_1.gridX == _SafeStr_6705) && (_arg_1.gridY == _SafeStr_6706)))
            {
                return (true);
            };
            return (false);
        }

        public function get layerIndex():int
        {
            return (_SafeStr_6661);
        }

        public function set layerIndex(_arg_1:int):void
        {
            _SafeStr_6661 = _arg_1;
        }

        public function get partIndex():int
        {
            return (_SafeStr_6568);
        }

        public function set partIndex(_arg_1:int):void
        {
            _SafeStr_6568 = _arg_1;
        }

        public function get colorIndex():int
        {
            return (_SafeStr_6704);
        }

        public function set colorIndex(_arg_1:int):void
        {
            _SafeStr_6704 = _arg_1;
        }

        public function get gridX():int
        {
            return (_SafeStr_6705);
        }

        public function set gridX(_arg_1:int):void
        {
            _SafeStr_6705 = _arg_1;
        }

        public function get gridY():int
        {
            return (_SafeStr_6706);
        }

        public function set gridY(_arg_1:int):void
        {
            _SafeStr_6706 = _arg_1;
        }

        public function get position():int
        {
            return ((gridY * 3) + gridX);
        }


    }
}//package com.sulake.habbo.groups.badge

// _SafeStr_6568 = "_-v1D" (String#7081, DoABC#4)
// _SafeStr_6661 = "_-E1g" (String#6451, DoABC#4)
// _SafeStr_6704 = "_-T1i" (String#11113, DoABC#4)
// _SafeStr_6705 = "_-31W" (String#7732, DoABC#4)
// _SafeStr_6706 = "_-i1p" (String#7150, DoABC#4)


