// by nota

//onBoardingHcUi.NineSplitSprite

package onBoardingHcUi
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import __AS3__.vec.Vector;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import com.sulake.habbo.utils._SafeStr_401;

    public class NineSplitSprite 
    {

        private static const border_sunk_png:Class = border_sunk_png$90e94ebf75a447055bd38e4d019918d42084950564;
        private static const dark_popup_png:Class = dark_popup_png$6c5f8c4e19d85f84e18aabe368cc02e81288384751;
        private static const divider_png:Class = divider_png$0c865acee4538fd5be5ca6b022e913ab1168670947;
        private static const frame_png:Class = _SafeStr_1041;
        private static const input_corrected_png:Class = input_corrected_png$7f90ff28d1bddfcdb7c1fce70898714b2079847462;
        private static const input_error_png:Class = input_error_png$9a10b49c4ba7f5eaf3cf947851bfb3d5914058021;
        private static const input_field_png:Class = _SafeStr_1044;
        private static const input_corrected_hitch_png:Class = _SafeStr_1042;
        private static const input_error_hitch_png:Class = input_error_hitch_png$3c0d437b965a8dab4bc7c84066beb4f72090190469;
        private static const input_field_hitch_png:Class = _SafeStr_1043;
        private static const white_balloon_png:Class = white_balloon_png$6500e7396091f59d91211616717775de568456739;
        private static const block_dark_base_png:Class = _SafeStr_833;
        private static const BORDER_SUNK_BITMAP:Bitmap = new border_sunk_png();
        public static const DARK_POPUP_BITMAP:Bitmap = new dark_popup_png();
        private static const DIVIDER_BITMAP:Bitmap = new divider_png();
        private static const FRAME_BITMAP:Bitmap = new frame_png();
        private static const INPUT_CORRECTED_BITMAP:Bitmap = new input_corrected_png();
        private static const INPUT_ERROR_BITMAP:Bitmap = new input_error_png();
        private static const INPUT_FIELD_BITMAP:Bitmap = new input_field_png();
        private static const INPUT_CORRECTED_HITCH_BITMAP:Bitmap = new input_corrected_hitch_png();
        private static const INPUT_ERROR_HITCH_BITMAP:Bitmap = new input_error_hitch_png();
        private static const INPUT_FIELD_HITCH_BITMAP:Bitmap = new input_field_hitch_png();
        private static const WHITE_BALLOON_BITMAP:Bitmap = new white_balloon_png();
        private static const DARK_BALLOON_BITMAP:Bitmap = new block_dark_base_png();

        public static var BALLOON_HIGHLIGHTED:NineSplitSprite = new NineSplitSprite(WHITE_BALLOON_BITMAP.bitmapData, new <int>[5, 4, 5], new <int>[11, 1, 5]);
        public static var BALLOON_SHADED:NineSplitSprite = new NineSplitSprite(WHITE_BALLOON_BITMAP.bitmapData, new <int>[5, 4, 5], new <int>[5, 1, 11]);
        public static var BORDER_SUNK:NineSplitSprite = new NineSplitSprite(BORDER_SUNK_BITMAP.bitmapData, new <int>[12, 2, 6], new <int>[14, 2, 4]);
        public static var DARK_POPUP:NineSplitSprite = new NineSplitSprite(DARK_POPUP_BITMAP.bitmapData, new <int>[5, 5, 5], new <int>[5, 12, 5]);
        public static var DIVIDER:NineSplitSprite = new NineSplitSprite(DIVIDER_BITMAP.bitmapData, new <int>[2, 2, 2], new <int>[8, 0, 0]);
        public static var FRAME:NineSplitSprite = new NineSplitSprite(FRAME_BITMAP.bitmapData, new <int>[4, 3, 4], new <int>[5, 1, 7]);
        public static var INPUT_CORRECTED:NineSplitSprite = new NineSplitSprite(INPUT_CORRECTED_BITMAP.bitmapData, new <int>[5, 2, 5], new <int>[5, 2, 6]);
        public static var INPUT_ERROR:NineSplitSprite = new NineSplitSprite(INPUT_ERROR_BITMAP.bitmapData, new <int>[5, 2, 5], new <int>[5, 2, 6]);
        public static var INPUT_FIELD:NineSplitSprite = new NineSplitSprite(INPUT_FIELD_BITMAP.bitmapData, new <int>[5, 4, 5], new <int>[7, 2, 5]);
        public static var INPUT_CORRECTED_HITCH:NineSplitSprite = new NineSplitSprite(INPUT_FIELD_HITCH_BITMAP.bitmapData, new <int>[10, 310, 10], new <int>[5, 21, 5]);
        public static var INPUT_ERROR_HITCH:NineSplitSprite = new NineSplitSprite(INPUT_ERROR_HITCH_BITMAP.bitmapData, new <int>[10, 310, 10], new <int>[5, 21, 5]);
        public static var INPUT_FIELD_HITCH:NineSplitSprite = new NineSplitSprite(INPUT_FIELD_HITCH_BITMAP.bitmapData, new <int>[10, 310, 10], new <int>[5, 21, 5]);
        public static var DARK_BALLOON:NineSplitSprite = new NineSplitSprite(DARK_BALLOON_BITMAP.bitmapData, new <int>[5, 4, 5], new <int>[11, 1, 5]);

        private var _bitmapData:BitmapData;
        private var _widths:Vector.<int>;
        private var _heights:Vector.<int>;

        public function NineSplitSprite(_arg_1:BitmapData, _arg_2:Vector.<int>, _arg_3:Vector.<int>)
        {
            _bitmapData = _arg_1;
            _widths = _arg_2;
            _heights = _arg_3;
        }

        public function render(_arg_1:int, _arg_2:int):Bitmap
        {
            var _local_3:Bitmap = new Bitmap(new BitmapData(_arg_1, _arg_2, true, 0xFFFFFF));
            renderOn(_local_3, new Rectangle(0, 0, _arg_1, _arg_2));
            return (_local_3);
        }

        public function renderOn(_arg_1:Bitmap, _arg_2:Rectangle):void
        {
            var _local_10:int;
            var _local_11:int;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_17:int = _arg_2.x;
            var _local_18:int = _arg_2.y;
            var _local_16:int = _arg_2.width;
            var _local_9:int = _arg_2.height;
            var _local_6:Vector.<int> = new <int>[0, _widths[0], (_widths[0] + _widths[1])];
            var _local_8:Vector.<int> = new <int>[0, _heights[0], (_heights[0] + _heights[1])];
            var _local_3:Vector.<int> = _widths;
            var _local_14:Vector.<int> = _heights;
            var _local_13:Vector.<int> = new <int>[_local_17, (_local_17 + _widths[0]), ((_local_17 + _local_16) - _widths[2])];
            var _local_15:Vector.<int> = new <int>[_local_18, (_local_18 + _heights[0]), ((_local_18 + _local_9) - _heights[2])];
            var _local_12:Vector.<int> = new <int>[_widths[0], ((_local_16 - _widths[0]) - _widths[2]), _widths[2]];
            var _local_4:Vector.<int> = new <int>[_heights[0], ((_local_9 - _heights[0]) - _heights[2]), _heights[2]];
            _local_10 = 0;
            while (_local_10 < 3)
            {
                _local_11 = 0;
                while (_local_11 < 3)
                {
                    if (!((((_local_12[_local_10] < 1) || (_local_4[_local_11] < 1)) || (_local_3[_local_10] < 1)) || (_local_14[_local_11] < 1)))
                    {
                        _local_7 = new Rectangle(_local_6[_local_10], _local_8[_local_11], _local_3[_local_10], _local_14[_local_11]);
                        if (((!(_local_10 == 1)) && (!(_local_11 == 1))))
                        {
                            _arg_1.bitmapData.copyPixels(_bitmapData, _local_7, new Point(_local_13[_local_10], _local_15[_local_11]));
                        }
                        else
                        {
                            _local_5 = new Rectangle(_local_13[_local_10], _local_15[_local_11], _local_12[_local_10], _local_4[_local_11]);
                            _arg_1.bitmapData.draw(_bitmapData, _SafeStr_401.rectangleTransformMatrix(_local_7, _local_5), null, null, _local_5, false);
                        };
                    };
                    _local_11++;
                };
                _local_10++;
            };
        }

        public function get bitmapData():BitmapData
        {
            return (_bitmapData);
        }


    }
}//package onBoardingHcUi

// _SafeStr_1041 = "frame_png$1a0221b7df76e0a9aad0b276cda7bd97-698782833" (String#11914, DoABC#3)
// _SafeStr_1042 = "input_corrected_hitch_png$3c82e96815b2e953a1211834e2fd3392-298672209" (String#4609, DoABC#3)
// _SafeStr_1043 = "input_field_hitch_png$9ac5c4ce9bdd23859f7d3d36c7957c93-2098911400" (String#4695, DoABC#3)
// _SafeStr_1044 = "input_field_png$1777473e39ad1513b8cc40832d12757c-33262313" (String#12386, DoABC#3)
// _SafeStr_401 = "_-e1d" (String#9279, DoABC#3)
// _SafeStr_833 = "block_dark_base_png$d600aa78d4385a00d6b799be49b389c1-66405239" (String#3803, DoABC#3)


