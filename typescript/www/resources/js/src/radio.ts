///<reference path='iAudible.ts'/>

class Radio implements IAudible
{
	public isPlaying:bool;

	constructor()
	{
		this.isPlaying = false;
	}
	public turnOn():void
	{
		console.log('radio on');
		this.isPlaying = false;
	}
	public playSelection(preset:number):void
	{
		console.log('radio selection play: channel preset', preset);
	}
	public turnOff():void
	{
		console.log('radio off');
		this.isPlaying = false;
	}
}