interface IAudible
{
	isPlaying:bool;
	turnOn():void;
	playSelection(preset:number):void;
	turnOff():void;
};