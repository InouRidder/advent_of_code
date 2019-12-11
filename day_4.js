function passwordcount(inputtext)
{
    let pwrange = inputtext.split('-').map(v => parseInt(v, 10));
    let pwcount = 0;
    //let consecutivesame = /(11|22|33|44|55|66|77|88|99|00)/; /*for part 1*/
    let consecutivesame = /(([^1]|^)11([^1]|$)|([^2]|^)22([^2]|$)|([^3]|^)33([^3]|$)|([^4]|^)44([^4]|$)|([^5]|^)55([^5]|$)|([^6]|^)66([^6]|$)|([^7]|^)77([^7]|$)|([^8]|^)88([^8]|$)|([^9]|^)99([^9]|$)|([^0]|^)00([^0]|$))/;
    for(let i = pwrange[0]; i < pwrange[1]; i++)
    {
      console.log(i)
        let istr = i.toString();
        let iparts = istr.split('');
        let sortstr = iparts.sort().join('');
        if(sortstr == istr && consecutivesame.test(istr))
        {
            pwcount++;
        }
    }
    return pwcount;
}

passwordcount('273025-767253')
