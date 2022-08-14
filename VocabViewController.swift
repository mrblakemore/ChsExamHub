//
//  VocabViewController.swift
//  
//
//  Created by Robby Blakemore on 12/6/17.
//

import UIKit
import Foundation

class VocabViewController: UIViewController {

    var data: [Vocab] = []
    
    @IBOutlet weak var quizMode: UISwitch!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var partOfSpeech: UILabel!
    @IBOutlet weak var definition: UILabel!
    @IBOutlet var swipeView: UIView!
    @IBOutlet var myView: UIView!
    
    let swipeRec = UISwipeGestureRecognizer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWords()
        setRandomWord()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(newWord(_:)))
        myView.addGestureRecognizer(tapGesture)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        myView.addGestureRecognizer(swipeGesture)

        

    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var wordIndex = 0
    
    func getRandomVocab() -> Vocab{
        let randomElement =  Int(arc4random_uniform(UInt32(data.count)))
        wordIndex = randomElement
        return data[randomElement]
    }
    
    var currDef : String = ""
    
    func setRandomWord()
    {
        let aVocab = getRandomVocab()
        word.text = aVocab.getWord()
        partOfSpeech.text = String(describing: aVocab.getPos())
        if quizMode.isOn
        {
            currDef = aVocab.getDefinition()
            definition.text = ""
        }
        else
        {
            currDef = aVocab.getDefinition()
            definition.text = currDef
        }
    }
    
    @IBAction func newWord(_ sender: UITapGestureRecognizer) {
        //setRandomWord()
        
        definition.text = currDef
    }

        @IBAction func handleSwipe(_ gestureRecognizer : UISwipeGestureRecognizer) {
            if gestureRecognizer.state == .ended {
                // Perform action.
                setRandomWord()
            }
        }
    
    
    
    @IBOutlet var myTap: UITapGestureRecognizer!
    
    @IBOutlet weak var instructionsLbl: UILabel!
    
    @IBAction func quizModeChanged(_ sender: UISwitch) {
        if quizMode.isOn{
            definition.text = ""
            instructionsLbl.text = "Click to reveal the definition. Swipe to get next word."
        }
        else{
            definition.text = currDef
            instructionsLbl.text = "Activate Quiz Mode to hide definition. Swipe to get next word."
        }
    }
    
    
    func loadWords() {
        /*data.append(Vocab(w: "Brevity", d: "briefness or conciseness in speech or writing", p: .noun) )
        data.append(Vocab(w: "Concise", d: "using few words in speaking or writing", p: .adjective) )
        data.append(Vocab(w: "Laconic", d: "using few words in speech", p: .adjective) )
        data.append(Vocab(w: "Pithy", d: "brief and full of meaning and substance; concise", p: .adjective) )
        data.append(Vocab(w: "Quiescent", d: "quiet; still; inactive", p: .adjective) )
        data.append(Vocab(w: "Reticent", d: "not talking much; reserved", p: .adjective) )
        data.append(Vocab(w: "Succinct", d: "clearly and briefly stated; concise ", p: .adjective) )
        */
        data.append(Vocab(w: "Taciturn ", d: "silent; sparing of words; close-mouthed ", p: .adjective))
        data.append(Vocab(w: "Detached ", d: "aloof; indifferent", p: .adjective))
        data.append(Vocab(w: "Indifferent ", d: "apathetic; showing little or no concern or care ", p: .adjective))
        data.append(Vocab(w: "Cantankerous ", d: "bad-tempered or irritable; quarrelsome ", p: .adjective))
        data.append(Vocab(w: "Insolent ", d: "boldly disrespectful in speech and behavior; rude ", p: .adjective))
        data.append(Vocab(w: "Pithy ", d: "brief and full of meaning and substance; concise ", p: .adjective))
        data.append(Vocab(w: "Miserly ", d: " careful with how money is spent; thrifty ", p: .adjective))
        data.append(Vocab(w: "Frugal ", d: " careful with money; thrifty; not prodigal or wasteful ", p: .adjective))
        data.append(Vocab(w: "Nonchalant ", d: " casual and indifferent ; not showing any great concern or worry about anything ", p: .adjective))
        data.append(Vocab(w: "Baneful ", d: " causing ruin; harmful; pernicious ", p: .adjective))
        data.append(Vocab(w: "Pretentious ", d: " claiming or pretending increased importance; ostentatious; affectedly grand ", p: .adjective))
        data.append(Vocab(w: "Succinct ", d: " clearly and briefly stated; concise ", p: .adjective))
        data.append(Vocab(w: "Mundane ", d: " commonplace; ordinary ", p: .adjective))
        data.append(Vocab(w: "Congenial ", d: " compatible; having kindred needs or tastes; sympathetic. ", p: .adjective))
        data.append(Vocab(w: "Precarious ", d: " dangerous or risky; uncertain ", p: .adjective))
        data.append(Vocab(w: "Rancorous ", d: " deeply hateful or spiteful; malicious ", p: .adjective))
        data.append(Vocab(w: "Devious ", d: " dishonest or deceptive; tricky ", p: .adjective))
        data.append(Vocab(w: "Banal ", d: " dull or stale because of overuse; trite; hackneyed ", p: .adjective))
        data.append(Vocab(w: "Prosaic ", d: " dull, commonplace ", p: .adjective))
        data.append(Vocab(w: "Pugnacious ", d: " eager to fight; belligerent ", p: .adjective))
        data.append(Vocab(w: "Affable ", d: " easy to talk to; easy to approach, friendly; kind; amiable. ", p: .adjective))
        data.append(Vocab(w: "Remote ", d: " emotionally distant and disinterested; aloof; uninvolved; distant, far away ", p: .adjective))
        data.append(Vocab(w: "Egotistical ", d: " excessively self-absorbed; very conceited ", p: .adjective))
        data.append(Vocab(w: "Virulent ", d: " extremely poisonous; deadly; full of spiteful hatred ", p: .adjective))
        data.append(Vocab(w: "Amiable ", d: " friendly, kind. ", p: .adjective))
        data.append(Vocab(w: "Disdainful ", d: " full of bitter scorn and pride; aloof ", p: .adjective))
        data.append(Vocab(w: "Lavish ", d: " generous in giving to others or in spending money ", p: .adjective))
        data.append(Vocab(w: "Magnanimous ", d: " generous in overlooking insult or injury by others; rising above pettiness ", p: .adjective))
        data.append(Vocab(w: "Benevolent ", d: " giving freely and easily to others; charitable; kind ", p: .adjective))
        data.append(Vocab(w: "Avaricious ", d: " greedy ", p: .adjective))
        data.append(Vocab(w: "Mercenary ", d: " greedy for self-gain; thinking only of money-making ", p: .adjective))
        data.append(Vocab(w: "Phlegmatic ", d: " hard to get excited or emotional; calm; slow-moving ", p: .adjective))
        data.append(Vocab(w: "Detrimental ", d: " harmful ", p: .adjective))
        data.append(Vocab(w: "Deleterious ", d: " harmful to one’s health or overall welfare; pernicious ", p: .adjective))
        data.append(Vocab(w: "Austere ", d: " having great economy; showing self-control when it comes to foregoing luxuries and frills; stern in manner or appearance ", p: .adjective))
        data.append(Vocab(w: "Haughty ", d: " having great pride in oneself and dislike for others ", p: .adjective))
        data.append(Vocab(w: "Narcissistic ", d: " having to do with extreme self-adoration and a feeling of superiority to everyone ", p: .adjective))
        data.append(Vocab(w: "Ostentatious ", d: " having to do with showing off; pretentious ", p: .adjective))
        data.append(Vocab(w: "Cryptic ", d: " hidden; hard to understand; mysterious; obscure ", p: .adjective))
        data.append(Vocab(w: "Polemical ", d: " inclined to argue or debate; controversial ", p: .adjective))
        data.append(Vocab(w: "Apathetic ", d: " indifferent; showing no caring, interest, or concern; lacking emotion ", p: .adjective))
        data.append(Vocab(w: "Malicious ", d: " intending to hurt or harm another; spiteful ", p: .adjective))
        data.append(Vocab(w: "Impassive ", d: " lacking emotion or drive ", p: .adjective))
        data.append(Vocab(w: "Stolid ", d: " lacking emotion or not showing any emotion; stoical ", p: .adjective))
        data.append(Vocab(w: "Insipid ", d: " lacking flavor or taste; unexciting ", p: .adjective))
        data.append(Vocab(w: "Vapid ", d: " lacking freshness and zest; flat; stale ", p: .adjective))
        data.append(Vocab(w: "Listless ", d: " lacking interest in something, usually because of illness, fatigue, or general sadness; spiritless ", p: .adjective))
        data.append(Vocab(w: "Contemptuous ", d: " lacking respect; scornful ", p: .adjective))
        data.append(Vocab(w: "Lackluster ", d: " lacking vitality, energy, or brightness; boring ", p: .adjective))
        data.append(Vocab(w: "Disputatious ", d: " likely to dispute or argue ", p: .adjective))
        data.append(Vocab(w: "Jocular ", d: " liking to be with people, joke around with them and have fun. ", p: .adjective))
        data.append(Vocab(w: "Odious ", d: " loathsome; evil; revolting in a disgusting way ", p: .adjective))
        data.append(Vocab(w: "Supercilious ", d: " looking down on others; proud and scornful ", p: .adjective))
        data.append(Vocab(w: "Hackneyed ", d: " made commonplace by overuse; trite ", p: .adjective))
        data.append(Vocab(w: "Captious ", d: " made for the sake of quarreling; quibbling ", p: .adjective))
        data.append(Vocab(w: "Reticent ", d: " not talking much; reserved ", p: .adjective))
        data.append(Vocab(w: "Bellicose ", d: " of a quarrelsome nature; eager to fight; warlike; belligerent ", p: .adjective))
        data.append(Vocab(w: "Arrogant ", d: " overbearing; proud; haughty ", p: .adjective))
        data.append(Vocab(w: "Parsimonious ", d: " overly thrifty or miserly ", p: .adjective))
        data.append(Vocab(w: "Ominous ", d: " pertaining to an evil omen; foreboding ", p: .adjective))
        data.append(Vocab(w: "Colloquial ", d: " pertaining to common everyday speech; conversational ", p: .adjective))
        data.append(Vocab(w: "Confounding ", d: " puzzling; baffling", p: .adjective))
        data.append(Vocab(w: "Contentious ", d: " quarrelsome; belligerent ", p: .adjective))
        data.append(Vocab(w: "Quiescent ", d: " quiet; still; inactive ", p: .adjective))
        data.append(Vocab(w: "Rhetorical ", d: " relating to speech that is used to persuade or have some effect; insincere in expression ", p: .adjective))
        data.append(Vocab(w: "Complacent ", d: " self-satisfied; smug", p: .adjective))
        data.append(Vocab(w: "Philanthropic ", d: " showing a desire to help others by giving gifts; charitable; humane ", p: .adjective))
        data.append(Vocab(w: "Iniquitous ", d: " showing a lack of fairness; wicked; vicious ", p: .adjective))
        data.append(Vocab(w: "Altruistic ", d: " showing an unselfish concern for others ", p: .adjective))
        data.append(Vocab(w: "Thrifty ", d: " showing care with how money and resources are spent or used ", p: .adjective))
        data.append(Vocab(w: "Amicable ", d: " showing goodwill; peaceable. ", p: .adjective))
        data.append(Vocab(w: "Convivial ", d: " sociable, outgoing in a festive way, especially when pertaining to eating and drinking; fond of good company. ", p: .adjective))
        data.append(Vocab(w: "Gregarious ", d: " sociable, outgoing. ", p: .adjective))
        data.append(Vocab(w: "Diffuse ", d: " spread out, not concise; wordy ", p: .adjective))
        data.append(Vocab(w: "Penurious ", d: " stingy; relating to great poverty, destitution", p: .adjective))
        data.append(Vocab(w: "Belligerent ", d: " taking part in war or fighting; ready to fight ", p: .adjective))
        data.append(Vocab(w: "Garrulous ", d: " talkative; loquacious ", p: .adjective))
        data.append(Vocab(w: "Voluble ", d: " talking a great deal with ease; glib ", p: .adjective))
        data.append(Vocab(w: "Presumptuous ", d: " too forward or bold; overstepping proper bounds ", p: .adjective))
        data.append(Vocab(w: "Aloof ", d: " uninterested; showing no concern; emotionally removed or distant ", p: .adjective))
        data.append(Vocab(w: "Trite ", d: " unoriginal and stale due to overuse ", p: .adjective))
        data.append(Vocab(w: "Derivative ", d: " unoriginal; taken from something that already exists", p: .adjective))
        data.append(Vocab(w: "Grandiloquent ", d: " using big and fancy words when speaking for the purpose of impressing others ", p: .adjective))
        data.append(Vocab(w: "Concise ", d: " using few words in speaking or writing ", p: .adjective))
        data.append(Vocab(w: "Laconic ", d: " using few words in speech ", p: .adjective))
        data.append(Vocab(w: "Bombastic ", d: " using language in a pompous, showy way; speaking to impress others ", p: .adjective))
        data.append(Vocab(w: "Terse ", d: " using only the words that are needed to make the point; very concise, sometimes to the point of rudeness ", p: .adjective))
        data.append(Vocab(w: "Verbose ", d: " using too many words; wordy; long-winded ", p: .adjective))
        data.append(Vocab(w: "Pernicious ", d: " very destructive or harmful, usually in an inconspicuous and relentless way ", p: .adjective))
        data.append(Vocab(w: "Munificent ", d: " very generous ", p: .adjective))
        data.append(Vocab(w: "Nefarious ", d: " very mean and wicked", p: .adjective))
        data.append(Vocab(w: "Loquacious ", d: " very talkative; liking to talk; garrulous ", p: .adjective))
        data.append(Vocab(w: "Cordial ", d: " warm and friendly; amiable. ", p: .adjective))
        data.append(Vocab(w: "Prodigal ", d: " wasteful; lavish ", p: .adjective))
        data.append(Vocab(w: "Quagmire ", d: " a difficult or troubling situation; a swampy ground, bog, mire ", p: .noun))
        data.append(Vocab(w: "Quandary ", d: " a dilemma; a confusing or puzzling situation ", p: .noun))
        data.append(Vocab(w: "Debacle ", d: " a failure or breakdown; a collapse that is often nonsensical ", p: .noun))
        data.append(Vocab(w: "Conflagration ", d: " a huge fire, an inferno ", p: .noun))
        data.append(Vocab(w: "Labyrinth ", d: " a maze from which it is very hard to extricate or free oneself", p: .noun))
        data.append(Vocab(w: "Enigma ", d: " a riddle or mystery; a puzzling or baffling matter or person ", p: .noun))
        data.append(Vocab(w: "Turmoil ", d: " a turbulent scenario or situation; tumult ", p: .noun))
        data.append(Vocab(w: "Cliché ", d: " an idea or expression that has become stale due to overuse ", p: .noun))
        data.append(Vocab(w: "Eloquence ", d: " artful ease with speaking; speech that can influence people’s feelings ", p: .noun))
        data.append(Vocab(w: "Brevity ", d: " briefness or conciseness in speech or writing ", p: .noun))
        data.append(Vocab(w: "Largess ", d: " generous giving", p: .noun))
        data.append(Vocab(w: "Adversity ", d: " great trouble or difficulty ", p: .noun))
        data.append(Vocab(w: "Turbulence ", d: " great unrest; turmoil or disorder ", p: .noun))
        data.append(Vocab(w: "Antagonism ", d: " hatred or hostility ", p: .noun))
        data.append(Vocab(w: "Animosity ", d: " hatred; ill will ", p: .noun))
        data.append(Vocab(w: "Levity ", d: " lightheartedness; gaiety; carefree disposition, particularly when not appropriate. ", p: .noun))
        data.append(Vocab(w: "Braggart ", d: " one who boasts a great deal ", p: .noun))
        data.append(Vocab(w: "Predator ", d: " one who takes advantage of another, exploits or feeds on another; a strong adversary or rival ", p: .noun))
        data.append(Vocab(w: "Platitude ", d: " quality of being dull; an obvious remark uttered as if it were original ", p: .noun))
        data.append(Vocab(w: "Circumlocution ", d: " speaking in circles; round about speech ", p: .noun))
        data.append(Vocab(w: "Mediate ", d: " to act as a go-between in settling conflicts or disputes between people or opposing sides. ", p: .verb))
        data.append(Vocab(w: "Assuage ", d: " to alleviate; to lessen pain or conflict; pacify. ", p: .verb))
        data.append(Vocab(w: "Pacify ", d: " to calm; to make peaceful; to resotre to a tranquil state. ", p: .verb))
        data.append(Vocab(w: "Upbraid ", d: " to chide; to scold bitterly ", p: .verb))
        data.append(Vocab(w: "Censure ", d: " to criticize strongly ", p: .verb))
        data.append(Vocab(w: "Carp ", d: " to find fault; to be critical", p: .verb))
        data.append(Vocab(w: "Allay ", d: " to lessen fear; to calm; to relieve pain. ", p: .verb))
        data.append(Vocab(w: "Alleviate ", d: " to lessen pain or discomfort.", p: .verb))
        data.append(Vocab(w: "Ameliorate ", d: " to make better; to lessen pain, difficulty, or tension. ", p: .verb))
        data.append(Vocab(w: "Placate ", d: " to make calm; to soothe. ", p: .verb))
        data.append(Vocab(w: "Mitigate ", d: " to make or become less severe; to lessen pain or damage. ", p: .verb))
        data.append(Vocab(w: "Appease ", d: " to make tranquil or quiet, especially by giving into another’s demands; to pacify. ", p: .verb))
        data.append(Vocab(w: "Impugn ", d: " to oppose or attack someone or something as false or refutable ", p: .verb))
        data.append(Vocab(w: "Mollify ", d: " to pacify, soothe, or appease; to make less severe or violent. ", p: .verb))
        data.append(Vocab(w: "Quell ", d: " to pacify; to subdue; to quiet down. ", p: .verb))
        data.append(Vocab(w: "Chastise ", d: " to punish or scold harshly ", p: .verb))
        data.append(Vocab(w: "Berate ", d: " to rebuke or scold in a harsh tone ", p: .verb))
        data.append(Vocab(w: "Rebuke ", d: " to reprimand or scold sharply ", p: .verb))
        data.append(Vocab(w: "Deride ", d: " to ridicule or make fun of; to scoff at", p: .verb))
        data.append(Vocab(w: "Castigate ", d: " to scold or punish severely", p: .verb))
        data.append(Vocab(w: "Deprecate ", d: " to show mild disapproval ", p: .verb))
        data.append(Vocab(w: "Rebuff ", d: " to snub; to bluntly refuse ", p: .verb))
        data.append(Vocab(w: "Prattle ", d: " to speak on and on in a senseless and silly manner;  to talk foolishly ", p: .verb))
        data.append(Vocab(w: "Reprove ", d: " to speak to in a disapproving manner; to scold ", p: .verb))
        data.append(Vocab(w: "Squander ", d: " to spend money (or time) in a wasteful, uncaring fashion ", p: .verb))
        data.append(Vocab(w: "Ramble ", d: " to talk on and on pointlessly, without clear direction ", p: .verb))
        data.append(Vocab(w: "Rant ", d: " to talk very loudly, even wildly; rave ", p: .verb))
        data.append(Vocab(w: "Swagger ", d: " to walk around in a proud, showy manner; to boast in a loud manner ", p: .verb))
        data.append(Vocab(w: "Digress ", d: " to wander off from the subject or topic ", p: .verb))
        data.append(Vocab(w: "Conciliate ", d: " to win a person over through special considerations or persuasive methods; reconcile. ", p: .verb))
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
